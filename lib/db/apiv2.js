var r = require('rethinkdb')
var util = require('util')
var Promise = require('bluebird')
var db = require('./')
var wireutil = require('../wire/util')
var logger = require('../util/logger')
var async = require('async')
var stringutil = require('../util/stringutil')

var dbapi = Object.create(null)


var log = logger.createLogger('db:apiv2')

dbapi.close = function (options) {
  return db.close(options)
}

/*
 二期新增接口 by jc
 */
dbapi.loadTaskList = function (condition) {
  var past = parseInt(condition.timePast)
  var now = parseInt(condition.timeNow)
  var taskTypes = condition.taskTypes
  var projectNames = condition.projectNames
  var userName = condition.userName
  //var page = condition.page
  //var pageSize = condition.pageSize
  //if (!page) {
  // page = 1
  //}
  //if (!pageSize) {
  // pageSize = 10
  //}
  // 左外连接
  /*var query = r.table("tasklist").without('detail').concatMap(function (task) {
    return r.table("apkinfo").getAll(task("fileID").default("")).coerceTo("array").do(function (apk) {
      return r.branch(
        apk.isEmpty(),
        [{left: task, right: null}],
        apk.map(function (apkinfo) {
          return {left: task, right: apkinfo}
        })
      );
    });
  }).map(function (doc) {
    return r.branch(
      doc("right").eq(null),
      {
        id: null,
        taskid: doc('left')('taskid'),
        appName: doc('left')('testName'),
	appVersion: '',
        projectName:doc('left')('projectName'),
        committime: doc('left')('committime').toEpochTime(),
        userName: doc('left')('userName'),
        fileID: null,
        allstatus: doc('left')('allstatus'),
        taskType: doc('left')('tasktype'),
	memo: doc('left')('memo').default(null)
      },
      {
        id: doc('right')('id'),
        taskid: doc('left')('taskid'),
        appName: doc('right')('appName'),
	appVersion: doc('right')('versionCode').default(''),
        projectName: doc('left')('projectName'),
        committime: doc('left')('committime').toEpochTime(),
        userName: doc('left')('userName'),
        fileID: doc('left')('fileID'),
        allstatus: doc('left')('allstatus'),
        taskType: doc('left')('tasktype'),
	memo: doc('left')('memo').default(null)
      }
    )
  }).filter(function (data) {
    return data('committime').gt(past).and(data('committime').lt(now))
  })*/

  var query = r.db('stf').table("tasklist").filter(function (data) {
    return data('committime').toEpochTime().gt(past).and(data('committime').toEpochTime().lt(now))
  })
  // 过滤测试类型
  if (taskTypes && taskTypes.length != 0) {
    query = query.filter(function (data) {
      return r.expr(taskTypes).contains(data('tasktype'))
    })
  }
  // 过滤项目名称
  if (projectNames && projectNames.length != 0) {
    query = query.filter(function (data) {
      return r.expr(projectNames).contains(data('projectName'))
    })
  }
  // 过滤提测人
  if (userName) {
    query = query.filter(function (data) {
      return data('userName').eq(userName)
    })
  }

  query = query.without('detail').map(function (task) {

    return {
      appName: task('appName').default(''),
      appVersion: task('appVersion').default(''),
      appCode: task('appCode').default(''),

      fileID: task('fileID').default(''),

      taskid: task('taskid'),
      projectName: task('projectName'),
      projectKind: task('projectKind').default('常规项目'),
      committime: task('committime').toEpochTime(),
      userName: task('userName'),
      allstatus: task('allstatus'),
      taskType: task('tasktype'),
      memo: task('memo').default(null),
      caseVersion: task('caseVersion').default('1500'),
      serials: task('serials').default([]),
      allcases: task('cases').default([]).count(),
      completedDevices: task('completedDevice').default([]),
      pycharmProject: task('pycharmProject').default([]),
      serialsOwner: task('serials').default([]).map(function (serial) {
        return { serial: serial }
      }).eqJoin('serial', r.db('stf').table('devices')).map(function (d) {
        return {
          serial: d('right')('serial'),
          owner: d('right')('owner')
        }
      })
    }

  }).orderBy(r.desc('committime'))
  /*var inner = r.do("", function (result) {
    var item = query
    return {
      count: item.count(),
      results: item.slice((page - 1) * pageSize, page * pageSize).coerceTo('array')
    };
  })*/
  //log.info(query.toString()) 
  return db.run(query)

}

/*
 二期修改接口 by jc 2017/1/18
 */
dbapi.loadPhone = function (manufacturer, version, dpis, status, recommend, root) {
  var query = r.db('stf').table('devices')

  // 标志是否有一个条件为空
  var is_all_empty = true

  if (manufacturer.length > 0) {
    is_all_empty = false
    query = query.filter(function (doc) {
      return r.expr(manufacturer).contains(doc("brand"))
    })
  }
  if (version.length > 0) {
    is_all_empty = false
    query = query.filter(function (doc) {
      return r.expr(version).contains(doc("version"))
    })
  }
  if (dpis.length > 0) {
    is_all_empty = false
    var targetDpis = []
    dpis.forEach(function (dpi) {
      var width = parseInt(dpi.split('x')[0])
      var height = parseInt(dpi.split('x')[1])
      targetDpis.push([width, height])
    })
    query = query.filter(function (doc) {
      return r.expr(targetDpis)
        .contains([doc("display")("width"), doc("display")("height")])
    })
  }
  if (status && status != '') {
    is_all_empty = false
    query = query.filter(r.row('owner').eq(null))
  }

  if (recommend) {
    is_all_empty = false
    if (recommend == 'p') {
      query = query.filter(r.js('(function (row) { return (row.support & 16) != 0; })'))
    }
    else {
      query = query.filter(r.js('(function (row) { return (row.support & 4) != 0; })'))
    }
  }

  if (root.length) {
    is_all_empty = false
    query = query.filter(function (doc) {
      return r.expr(root).contains(doc('root'))
    })
  }


  // 最后判断，所有条件是否为空
  if (is_all_empty) {
    query = query.filter(false)
  }

  query = query.filter(r.row('present').eq(true)).group('brand')
  //log.info(query.toString())
  return db.run(query)
}

/*
 二期新增接口 by jc 2017/1/18
 */
dbapi.loadProjectInfo = function () {
  return db.run(r.table('ProjectInfo').group('projectStudio'))
}

/*
 V2接口,统一 app/api/v1/phonemodels
 app/api/v1/phonedpis
 by jc 2017/1/18
 */
dbapi.loadPhoneModel = function () {
  return db.run(r.table('devices').filter(r.row('present').eq(true)).withFields('serial', 'manufacturer', 'version', 'display', 'brand'))
  //return db.run(r.table('devices').withFields('serial', 'manufacturer', 'version', 'display'))

}

/*
 V2接口,增加分页功能
 */
dbapi.loadUserApkinfo = function (page, pageSize) {
  var query = r.table('apkinfo').filter(function (row) {
    return row('projectName').ne('unknown') //r.row('projectName').ne('unknown')
  }).map(function (apk) {
    return {
      appName: apk('appName'),
      committime: apk('committime'),
      fileName: apk('fileName'),
      id: apk('id'),
      package: apk('package'),
      userName: apk('userName'),
      projectName: apk('projectName'),
      versionName: apk('versionName').default(''),
      versionCode: apk('versionCode').default('')

    }
  })
  var inner = r.do("", function (result) {
    var item = query
    return {
      count: item.count(),
      results: item.coerceTo('array')//.slice((page - 1) * pageSize, page * pageSize).coerceTo('array')
    };
  })
  return db.run(inner)
}


dbapi.loadTaskDevdetail = function (taskid) {
  return db.run(r.table('tasklist').get(taskid)('detail')
    .innerJoin(r.table('devices'), function (taskserial, devdetail) {
      return taskserial('serial').eq(devdetail('serial'));
    })
    .map({
      serial: r.row('left')('serial'),
      model: r.row('left')('model'),
      result: r.row('left')('result'),
      status: r.row('left')('status').default('fail'),
      statusCode: r.row('left')('statusCode').default(''),
      version: r.row('right')('version'),
      height: r.row('right')('display')('height'),
      width: r.row('right')('display')('width')
    }))
}

dbapi.filterTaskDevdetail = function (taskid, data) {
  return db.run(r.table('tasklist').get(taskid)('detail')
    .innerJoin(r.table('devices'), function (taskserial, devdetail) {
      return taskserial('serial').eq(devdetail('serial'));
    })
    .map({
      serial: r.row('left')('serial'),
      //logs: r.row('left')('logs'),
      model: r.row('left')('model'),
      //performance:r.row('left')('performance'),
      result: r.row('left')('result'),
      //screenCap:r.row('left')('screenCap'),
      status: r.row('left')('status').default('fail'),
      statusCode: r.row('left')('statusCode').default(''),
      markName: r.row('right')('markName'),
      version: r.row('right')('version'),
      height: r.row('right')('display')('height'),
      width: r.row('right')('display')('width')
    })
    .filter(function (doc) {
      var ret = 0;
      if (data.status.length > 0) {
        ret |= 0x01
      }
      if (data.version.length > 0) {
        ret |= 0x02
      }
      if (data.width.length > 0) {
        ret |= 0x04
      }
      if (ret == 0) {
        return r.expr(['success', 'fail']).contains(doc("status").default('fail'))
      }
      else if (ret == 1) {
        return r.expr(data.status).contains(doc("status").default('fail'))
      }
      else if (ret == 2) {
        return r.expr(data.version).contains(doc("version"))
      }
      else if (ret == 3) {
        return r.expr(data.status).contains(doc("status").default('fail'))
          .and(r.expr(data.version).contains(doc("version")))
      }
      else if (ret == 4) {
        return r.expr(data.status).contains(doc("status").default('fail'))
      }
      else if (ret == 5) {
        return r.expr(data.status).contains(doc("status").default('fail'))
          .and(r.expr(data.width).contains(doc("width")))
        //.and(r.expr(data.height).contains(doc("height")))
      }
      else if (ret == 6) {
        return r.expr(data.version).contains(doc("version"))
          .and(r.expr(data.width).contains(doc("width")))
        //.and(r.expr(data.height).contains(doc("height")))
      }
      else if (ret == 7) {
        return r.expr(data.status).contains(doc("status").default('fail'))
          .and(r.expr(data.version).contains(doc("version")))
          .and(r.expr(data.width).contains(doc("width")))
        //.and(r.expr(data.height).contains(doc("height"))) 
      }
      else {
        return r.expr(['success', 'fail']).contains(doc("status").default('fail'))
      }
    })
  )
}


dbapi.filterTaskActivitydetail = function (taskid, data) {
  var query = r.table('tasklist').get(taskid)('detail')
    .innerJoin(r.table('devices'), function (taskserial, devdetail) {
      return taskserial('serial').eq(devdetail('serial'));
    })
    .map({
      serial: r.row('left')('serial'),
      model: r.row('left')('model'),
      screenCap: r.row('left')('screenCap'),
      status: r.row('left')('status'),
      statusCode: r.row('left')('statusCode'),
      version: r.row('right')('version'),
      height: r.row('right')('display')('height'),
      width: r.row('right')('display')('width'),
      markName: r.row('right')('markName')
    })
    .filter(function (doc) {
      var ret = 0;
      if (data.version.length > 0) {
        ret |= 0x01
      }
      if (data.width.length > 0) {
        ret |= 0x02
      }
      if (ret == 0) {
        return r.expr(['success', 'fail']).contains(doc("status"))
      }
      else if (ret == 1) {
        return r.expr(data.version).contains(doc("version"))
      }
      else if (ret == 2) {
        return r.expr(data.width).contains(doc("width"))
      }
      else if (ret == 3) {
        return r.expr(data.version).contains(doc("version"))
          .and(r.expr(data.width).contains(doc("width")))
      }
      else {
        r.expr(['success', 'fail']).contains(doc("status"))
      }
    })
  // log.info(query.toString())
  return db.run(query)
}


dbapi.loadActivityTaskDetail = function (taskid) {
  return db.run(r.table('tasklist').get(taskid)('detail')
    .innerJoin(r.table('devices'), function (taskserial, devdetail) {
      return taskserial('serial').eq(devdetail('serial'));
    })
    .map({
      serial: r.row('left')('serial'),
      screenCap: r.row('left')('screenCap'),
      version: r.row('right')('version'),
      height: r.row('right')('display')('height'),
      width: r.row('right')('display')('width'),
      manufacturer: r.row('right')('manufacturer'),
      markName: r.row('right')('markName')
    }))
}



dbapi.loadReportImg = function (taskid, serial) {
  return db.run(r.table('tasklist').get(taskid)('detail')
    .filter(r.row('serial').eq(serial))('screenCap'))
}


dbapi.loadActivityDetail = function (taskid) {

  var query = r.table('tasklist').get(taskid).do(function (task) {
    return r.branch(
      task,
      task,
      null
    )
  })
  return db.run(query)
}


/*
 V2接口,获取所有项目名称,不考虑工作室 by jc 2017/2/5
 */
dbapi.loadProjectName = function () {
  return db.run(r.table('ProjectInfo'))
}

dbapi.loadTestSuite = function (project, module, version, page, pageSize, type) {
  var query = r.table('testCase')
  query = project ? query.filter({ project_name: project }) : query
  query = version ? query.filter({ case_version: version }) : query
  query = type ? query.filter({ project_kind: type }) : query

  query = module ? query.filter(function (obj) {
    return obj('module').eq(module).or(obj('sub_module').eq(module))
  }) : query
  query = query.map(function (obj) {
    return {
      module: obj('module'),
      sub_module: obj('sub_module'),
      project_name: obj('project_name'),
      module_desc: obj('module_desc'),
      case_version: obj('case_version')
    }
  })
  return db.run(query)
}

//dbapi.loadTestSuite = function (project, suite, page, pageSize) {
// 
//    var query = r.table('testCase')
//    query = project ? query.filter({project_name: project}) : query
//    query = suite ? (suite == '*' ? query.filter(function (data) {
//      return data('modules').count().eq(0)
//    }) : query.filter(function (data) {
//      return data('modules').count().gt(0).and(data('modules')(0).eq(suite))
//    })) : query
//    return db.run(query)
//  
/* 
    var query = r.table('testCase')
    if (project) {
      query = query.filter({project_name: project})
    }
    if (suite) {
      query = query.filter(function (data) {
        return data('modules').count().gt(0).and(data('modules')(0).eq(suite))
      })
    }
    return db.run(query)
*/

/*if(!projectId) { projectId = '' }
return db.run(r.table('ProjectInfo').get(projectId)).then(function (project) {
  var query = r.table('testCase')
  var project_name = (project ? project.projectName : null)
  if(project_name) {
    query = query.filter({project_name: project_name})
  }
  if(suiteId) {
    query = query.filter(function (data) {
      return  data('modules').count().gt(0).and(data('modules')(0).eq(suiteId))
    })
  }
  return db.run(query)
})*/
/*var query = r.table('testSuite')
if (projectId) {
  query = query.filter({project_id: projectId})
}
if (suiteId) {
  query = query.filter({id: suiteId})
}
query = query.concatMap(function (suite) {
  return r.table("testCase").filter({test_suite_id: suite('id')}).coerceTo("array").do(function (accounts) {
    return r.branch(
      accounts.isEmpty(),
      [{suite_id: suite('id'), suite_name: suite('name'), desc: suite('desc'), project_id: suite('project_id'), caseCount: 0}],
      [{suite_id: suite('id'), suite_name: suite('name'), desc: suite('desc'), project_id: suite('project_id'), caseCount: accounts.count()}]
    )
  })
}).eqJoin('project_id', r.table('ProjectInfo')).map(function (doc) {
  return {
    suite_id: doc('left')('suite_id'),
    suite_name: doc('left')('suite_name'),
    desc: doc('left')('desc'),
    case_count: doc('left')('caseCount'),
    project_name: doc('right')('projectName')
  }
})
var inner = r.do("", function (result) {
  var item = query
  return {
    count: item.count(),
    result: item.slice((page - 1) * pageSize, page * pageSize).coerceTo('array')
  };
})
return db.run(inner)
*/
//}

dbapi.loadTestCase = function (project, version, module, sub_module, type) {
  var query = r.table('testCase').filter({ project_name: project, case_version: version })

  if (type) {
    query = query.filter({ project_kind: type })
  }

  if (module) {
    query = query.filter({ module: module })
  }
  else if (sub_module) {
    query = query.filter({ module: '', sub_module: sub_module })
  }
  query = query.map(function (obj) {
    return {
      module: obj('module'),
      sub_module: obj('sub_module'),
      project_name: obj('project_name'),
      package: obj('package'),
      module_desc: obj('module_desc'),
      logic_id: obj('logic_id'),
      class_name: obj('class_name'),
      owner: obj('owner'),
      priority: obj('priority'),
      status: obj('status'),
      doc_string: obj('doc_string'),
      mtime: obj('mtime').default(null)
    }
  })

  return db.run(query)
  /*
    var query = r.table('testCase').filter({project_name: project}).filter(function (data) {
      return r.branch(
        r.expr(suite).eq('*'),
        data('modules').count().eq(0),
        data('modules')(0).eq(suite)
      )
    })
    log.info(query.toString())
    return db.run(query)
  */
  /* 
    var query = r.db("stf").table("testSuite").filter({id: suiteId}).concatMap(function (suite) {
      return r.db("stf").table("testCase").filter({test_suite_id: suite('id')}).coerceTo("array").do(function (accounts) {
        return r.branch(
          accounts.isEmpty(),
          [{
            suite_id: suite('id'),
            suite_name: suite('name'),
            package: suite('package'),
            class: suite('class'),
            parameter: suite('parameter'),
            desc: suite('desc'),
            project_id: suite('project_id'),
            cases: []
          }],
          [{
            suite_id: suite('id'),
            suite_name: suite('name'),
            package: suite('package'),
            class: suite('class'),
            parameter: suite('parameter'),
            desc: suite('desc'),
            project_id: suite('project_id'),
            cases: accounts.map(function (c) {
              return {id: c('id'), name: c('name'), parameter: c('parameter'), logic_id: c('logic_id'), method: c('method'), desc: c('desc')}
            })
          }]
        )
      })
    }).eqJoin('project_id', r.db('stf').table('ProjectInfo')).zip()
    return db.run(query)
  }
  
  */

}

dbapi.filterUI = function (taskId, os_version, width_height, manufacturer) {
  /*var query = r.table('tasklist').get(taskId).without({'detail':{'cases':'error'}}).do(function (obj) {
    return r.branch(obj,
      {
        devices: obj('detail').eqJoin('serial', r.table('devices')).map(function (device) {
          return {
            serial: device('left')('serial'),
            version: device('right')('version'),
            status: device('left')('status'),
	    result: device('left')('result'),
            markName: device('right')('markName'),
	    cases: r.branch(device('left').hasFields('cases'), device('left')('cases').eqJoin('name', r.table('testCase'), {index: 'name_for_query'}).filter(function (d) {
                return r.branch(
                  obj.hasFields('caseVersion'),
                  obj('caseVersion').eq(d('right')('case_version')),
                  true
                )
              }).map(function (d) {
              var result = {
		result: d('left')('result')
              };
	      return result
            }), []),
            height: device('right')('display')('height'),
            width: device('right')('display')('width'),
            manufacturer: device('right')('manufacturer')
          }
        }).filter(function (d) {
          return r.branch(r.expr(os_version).count().ne(0), r.expr(os_version).contains(d('version')), true)
        }).filter(function (w) {
          return r.branch(r.expr(width_height).count().ne(0), r.expr(width_height).contains([w("width"), w("height")]), true)
        }).filter(function (m) {
          return r.branch(r.expr(manufacturer).count().ne(0), r.expr(manufacturer).contains(m('manufacturer')), true)
        })
      },
      {})
  })*/
  var query = r.db('stf').table('tasklist').get(taskId).without({ 'detail': { 'cases': 'error' } }).do(function (task) {

    return r.branch(
      task,
      {
        casesCount: task('cases').default([]).count(),
        serials: task('serials').default([]),
        projectName: task('projectName'),
        caseVersion: task('caseVersion').default('1500'),
        pycharmProject: task('pycharmProject').default([]),
        projectKind: task('projectKind').default('常规项目'),
        devices: task('serials').default([]).map(function (serial) {
          return {
            "serial": serial
          }
        }).eqJoin('serial', r.db('stf').table('devices')).map(function (d) {
          return {
            serial: d('right')('serial'),
            markName: d('right')('markName').default(''),
            version: d('right')('version'),
            manufacturer: d('right')('manufacturer'),
            width: d('right')('display')('width').default(''),
            height: d('right')('display')('height').default(''),
            owner: d('right')('owner')
          }
        }),
        completedDevices: task('detail').map(function (detail) {
          return {
            serial: detail('serial'),
            status: detail('status'),
            sucCount: detail('cases').default([]).filter({ result: 'True' }).count(),
            failCount: detail('cases').default([]).filter({ result: 'False' }).count(),
            pendingCount: detail('cases').default([]).filter({ result: 'pending' }).count(),
            result: detail('result'),
          }
        })
      },
      null
    )
  })
  return db.run(query)
}

dbapi.loadSuiteCaseByProjectId = function (projectId) {
  var query = r.table('testCase').filter(function (data) {
    return data('project_name').eq(r.table('ProjectInfo').get(projectId)('projectName'))
  })
  return db.run(query)
}

dbapi.saveTask = function (task) {
  task.committime = r.now().inTimezone('+08:00')
  var query = r.table('tasklist').insert(task)
  return db.run(query)
}

dbapi.filterCase = function (projectName, moduleName) {
  var query = r.table('testCase')
  if (projectName) {
    query = query.filter({ project_name: projectName })
  }
  if (moduleName) {
    query = query.filter(function (data) {
      return data('modules').contains(moduleName)
    })
  }
  return db.run(query)
}

dbapi.deleteCase = function (condition) {
  // 选删用例集
  var query = r.db('stf').table('testCase').filter(condition).forEach(function (c) {
    return r.db('stf').table('caseSet').update(function (set) {
      return r.branch(
        set('cases').contains(c('id')),
        {
          cases: set('cases').deleteAt(set('cases').offsetsOf(c('id')).nth(0))
        },
        set
      )
    })
  })
  return db.run(query).then(function (result) {
    var query2 = r.table('testCase').filter(condition).delete()
    return db.run(query2)
  })
}

dbapi.clearCase = function () {
  var query = r.table('testCase').delete()
  return db.run(query)
}
dbapi.saveCase = function (c) {
  var query = r.table('testCase').insert(c)
  return db.run(query)
}

dbapi.getCaseByIds = function (ids) {
  var query = r.expr(ids).map(function (ss) {
    return {
      id: ss
    }
  }).innerJoin(r.db('stf').table('testCase'), function (a, b) {
    return a('id').eq(b('id'))
  }).map(function (data) {
    return {
      id: data('right')('id'),
      class_name: data('right')('class_name'),
      local_path: data('right')('local_path'),
      base_url: data('right')('base_url')
    }
  })
  return db.run(query)
}
dbapi.getCaseByProject = function (project, version, type) {
  var query = r.table('testCase')
  if (project) {
    query = query.filter({ project_name: project })
  }
  if (version) {
    query = query.filter({ case_version: version })
  }
  if (type) {
    query = query.filter({ project_kind: type })
  }
  return db.run(query)
}

dbapi.updateOrInsert = function (cases) {
  var _p = []
  cases.forEach(function (c) {
    var p = function (callback) {
      db.run(r.table('testCase').filter({ local_path: c.local_path, class_name: c.class_name }), function (err, result) {
        result.toArray(function (err, re) {
          // update
          if (re.length) {
            c.id = re[0].id
            db.run(r.table('testCase').insert(c, { conflict: "replace" }), function (err, r) {
              console.log('update')
              callback(null, 'update')
            })
          }
          // insert
          else {
            db.run(r.table('testCase').insert(c), function (err, r) {
              console.log('insert')
              callback(null, 'insert')
            })
          }
        })
      })
    }
    _p.push(p)
  })

  return new Promise(function (resolve, reject) {
    async.series(_p, function (err, result) {
      console.log('end')
      resolve(result)
    })
  })
  /*var _p = []
  cases.forEach(function (c) {

    var p = new Promise(function (resolve, jreject) {
      db.run(r.table('testCase').filter({local_path: c.local_path, class_name: c.class_name}), function (err, result) {

        if (err) {
          resolve()
        }
        result.toArray(function (err, re) {
          console.log(re)
          if (err) {
            resolve()
          }
          // update
          if (re.length) {
            c.id = re[0].id
            if(!c.sequence) {
              db.run(r.db('stf').table('testCase').max('sequence')('sequence').default(0).add(1)).then(function (max) {
                c.sequence = max
                c.logic_id = 'C' + stringutil.format(max, '0', 4)
                db.run(r.table('testCase').insert(c, {conflict: "replace"}), function (err, r) {
                  console.log('update')
                  callback(null, 'update')
                })
              })
            }
            else {
              db.run(r.table('testCase').insert(c, {conflict: "replace"}), function (err, r) {
                console.log('update')
                callback(null, 'update')
              })
            }
          }
          // insert
          else {
            db.run(r.table('testCase').insert(c), function (err, r) {
              log.info('insert')
              resolve()
            })
          }
        })
      })
    })
    _p.push(p)
  })
  return Promise.all(_p)
*/
}

dbapi.loadCaseVersion = function (projectName, type) {
  var query = r.db('stf').table('testCase')
  if (projectName) {
    query = query.filter({ project_name: projectName })
  }
  if (type) {
    query = query.filter({ project_kind: type })
  }
  query = query.pluck('case_version').distinct()
  return db.run(query)
}

dbapi.loadUIModule = function (taskid, serial) {
  var query = r.db('stf').table('tasklist').get(taskid).do(function (task) {
    return r.branch(
      task,
      task('detail').filter({ serial: serial }).nth(0).do(function (taskdetail) {
        return r.branch(
          taskdetail.hasFields('cases'),

          taskdetail('cases').eqJoin('name', r.db('stf').table('testCase'), { index: 'name_for_query' }).filter(function (d) {
            return r.branch(
              task.hasFields('caseVersion'),
              task('caseVersion').eq(d('right')('case_version')),
              true
            )
          }).map(function (c) {
            return {
              suiteName: r.branch(c('right')('module').eq(''), c('right')('sub_module'), c('right')('module')),
              suiteDesc: c('right')('module_desc'),
            }
          }).distinct(),
          []
        )
      }),
      []
    )
  })
  return db.run(query)
}

dbapi.loadUITest = function (taskid, serial, modules, status) {
  var query = r.db('stf').table('tasklist').get(taskid).do(function (task) {
    return r.branch(
      task,
      task('detail').filter({ serial: serial }).nth(0).default({}).do(function (taskdetail) {
        return r.branch(
          taskdetail.hasFields('cases'),
          taskdetail('cases').eqJoin('name', r.db('stf').table('testCase'), { index: 'name_for_query' }).filter(function (d) {
            return d('right')('project_name').eq(task('projectName'))
          }).filter(function (d) {
            return r.branch(
              task.hasFields('caseVersion'),
              task('caseVersion').eq(d('right')('case_version')),
              true
            )
          }).filter(function (d) {
            return r.branch(
              r.expr(modules).count().ne(0),
              r.expr(modules).contains(d('right')('sub_module')),
              true
            )
          }).filter(function (d) {
            return r.branch(
              // status是非null
              status,
              d('left')('result').eq(status),
              true
            )
          }).map(function (c) {
            return {
              caseId: c('right')('logic_id'),
              caseDesc: c('right')('doc_string'),
              endtime: c('left')('endtime'),
              starttime: c('left')('starttime'),
              caseName: c('right')('class_name'),
              result: c('left')('result'),
              suiteName: r.branch(c('right')('module').eq(''), c('right')('sub_module'), c('right')('module')),
              suiteDesc: c('right')('module_desc'),
              error: c('left')('error'),
              screenCaps: c('left')('screenCaps').map(function (cap) {
                //return cap.split(taskid).nth(1)
                return cap.split('/var/stf/file').nth(1)
              })
            }
          }),
          []
        )
      }),
      []
    )
  })
  return db.run(query)
}

dbapi.loadFailTestCaseIds = function (taskId, serial) {
  var query = r.db('stf').table('tasklist').get(taskId).do(function (task) {
    return r.branch(
      task,
      {

        version: task('caseVersion'),
        fileId: task('fileID'),
        projectName: task('projectName'),
        projectKind: task('projectKind'),
        testEnv: task('testEnv'),
        // memo: task('memo').default(null),
        account: task('account').default(null),
        module: task('moduleName').default(null),
        pycharmProject: task('pycharmProject').default([]),
        appCode: task('appCode').default(''),
        appName: task('appName').default(''),
        appVersion: task('appVersion').default(''),
        caseVersion: task('caseVersion').default(''),
        tasktype: task('tasktype'),

        cases: task('detail').map(function (obj) {
          return r.branch(
            obj('serial').eq(serial),

            r.branch(
              obj('cases').default([]).count().ne(0),

              obj('cases').map(function (caseresult) {
                return r.branch(caseresult('result').eq('False'),
                  { name: caseresult('name') },
                  null)
              }).eqJoin('name', r.db('stf').table('testCase'), { index: 'name_for_query' }).map(function (node) {
                return {
                  case_version: node('right')('case_version'),
                  id: node('right')('id')
                }
              }).filter({ case_version: task('caseVersion') }).map(function (result) {
                return r.branch(result,
                  result('id'),
                  null
                )
              }
                ),
              task('cases').default([])

            ),

            null
          )
        })

      },
      null
    )
  })
  return db.run(query)
}

dbapi.loadFailTestCase = function (taskId, serial) {
  var query = r.db('stf').table('tasklist').get(taskId).do(function (task) {
    return r.branch(
      task,
      {
        cases: task('detail').map(function (obj) {
          return r.branch(
            obj('serial').eq(serial),

            r.branch(
              //obj.hasFields('cases').and(obj('cases').count().ne(0)),
              obj('cases').default([]).count().ne(0),

              obj('cases').map(function (caseresult) {
                return r.branch(

                  caseresult('result').eq('False'),
                  { name: caseresult('name') },

                  null)
              }).eqJoin('name', r.db('stf').table('testCase'), { index: 'name_for_query' }).map(function (node) {
                return {
                  case_version: node('right')('case_version'),
                  mtime: node('right')('mtime'),
                  name: node('right')('class_name'),
                  owner: node('right')('owner')
                }

              }).filter({ case_version: task('caseVersion') }),

              task('cases').default([]).map(function (c) {
                return {
                  caseId: c
                }
              }).eqJoin('caseId', r.db('stf').table('testCase')).map(function (node) {
                return {
                  case_version: node('right')('case_version'),
                  mtime: node('right')('mtime'),
                  name: node('right')('class_name'),
                  owner: node('right')('owner')
                }

              }).filter({ case_version: task('caseVersion') })

            ),
            null
          )
        })
      },
      null
    )
  })
  return db.run(query)
}

dbapi.saveSendEmail = function (groupsdata) {
  return db.run(r.table('sendemail').insert(groupsdata))
}

dbapi.setDevice = function (condition, data) {
  var query = r.db('stf').table('devices').filter(condition).update(data)
  log.info(query.toString())
  return db.run(query)
}

dbapi.deleteDevice = function (condition) {
  var query = r.db('stf').table('devices').filter(condition).delete()
  return db.run(query)
}

dbapi.getSerialImgs = function (taskid, serial) {
  var query = r.db('stf').table('tasklist').get(taskid)('detail').filter(r.row('serial').eq(serial)).map(function (device) {
    return device('cases').default([]).map(function (c) {
      return c('screenCaps').default([])
    })
  })
  return db.run(query)
}

dbapi.getSelection = function () {

  var querySupportType = r.db('stf').table('supportType').map(function (supportType) {
    return {
      label: supportType('name').default(''),
      value: supportType('value').default(0)
    }
  })
  var queryBrand = r.db('stf').table('brand').map(function (brand) {
    return {
      label: brand('name').default(''),
      order: brand('value').default(0)
    }
  })
  var queryDpis = r.db('stf').table('devices').map(function (device) {
    return {
      width: device('display')('width').default(null),
      height: device('display')('height').default(null),
      version: device('version').default('')
    }
  })
  var inner = r.do("", function (result) {
    var st = querySupportType
    var b = queryBrand
    var dpis = queryDpis
    return {
      s: st.coerceTo('array'),
      b: b.coerceTo('array'),
      dpis: dpis.coerceTo('array')
    }
  })
  return db.run(inner)
}

dbapi.getDeviceAndSelection = function (condition) {
  var querySupportType = r.db('stf').table('supportType').map(function (supportType) {
    return {
      label: supportType('name').default(''),
      value: supportType('value').default(0)
    }
  })
  var queryBrand = r.db('stf').table('brand').map(function (brand) {
    return {
      label: brand('name').default(''),
      value: brand('value').default(0)
    }
  })

  var queryDpis = r.db('stf').table('devices').map(function (device) {
    return {
      width: device('display')('width').default(null),
      height: device('display')('height').default(null)
    }
  })

  var queryDevice = r.db('stf').table('devices')
  if (condition) {
    queryDevice = queryDevice.filter(condition)
  }
  var inner = r.do("", function (result) {
    var st = querySupportType
    var b = queryBrand
    var dpis = queryDpis
    var d = queryDevice
    return {
      s: st.coerceTo('array'),
      b: b.coerceTo('array'),
      dpis: dpis.coerceTo('array'),
      d: d.coerceTo('array')
    };
  })
  return db.run(inner)
}

dbapi.getDeviceByMany = function (brand, os, version, support) {
  var query = r.db('stf').table('devices')
  if (brand.length > 0) {
    query = query.filter(function (doc) {
      return r.expr(brand).contains(doc('brand'))
    })
  }
  if (os.length > 0) {
    query = query.filter(function (doc) {
      return r.expr(os).contains(doc('platform'))
    })
  }
  if (version.length > 0) {
    query = query.filter(function (doc) {
      return r.expr(version).contains(doc('version'))
    })
  }
  if (support) {
    query = query.filter(r.js('(function (row) { return (row.support & ' + support + ') != 0; })'))
  }
  log.info(query.toString())
  return db.run(query)

}

dbapi.getDevice = function (condition) {
  var query = r.db('stf').table('devices')
  if (condition) {
    query = query.filter(condition)
  }
  return db.run(query)
}

dbapi.getProcess = function (taskids) {
  var p = []
  taskids.forEach(function (taskid) {

    var _p = new Promise(function (resolve, reject) {
      var query = r.db('stf').table('tasklist').get(taskid).do(function (task) {
        return {
          taskid: task('taskid'),
          serials: task('serials').default([]),
          allcases: task('cases').default([]),
          cases: task('detail').map(function (detail) {
            return detail('cases').default([]).map(function (devicedetail) {
              return devicedetail('name')
            })
          })
        }
      })
      db.run(query).then(function (obj) {
        resolve(obj)
      })
    })
    p.push(_p)

  })
  return Promise.all(p)

}

dbapi.getCaseProcess = function (taskid) {

  var query = r.db('stf').table('tasklist').get(taskid).do(function (task) {
    return r.branch(task,
      {
        serials: task('serials').default([]),
        cases: task('cases').default([]),
        projectName: task('projectName'),
        caseVersion: task('caseVersion')
      },
      null
    )
  })
  return db.run(query)
}

dbapi.insertApk = function (apkinfo) {
  var query = r.table('apkinfo').insert(apkinfo)
  return db.run(query)
}

dbapi.groupTestCase = function () {
  var query = r.db('stf').table('testCase').group('project_name', 'case_version').count()
  return db.run(query)
}

dbapi.insertCaseSet = function (data) {
  var query = r.db('stf').table('caseSet').insert(data)
  return db.run(query)
}

dbapi.filterCaseSet = function (data) {
  var query = r.db('stf').table('caseSet')
  if (data) {
    query = query.filter(data)
  }
  query = query.map(function (set) {
    return {
      id: set('id'),
      project: set('project'),
      versoin: set('version'),
      creator: set('creator'),
      name: set('name'),
      type: set('type'),
      cases: set('cases').map(function (c) {
        return { id: c }
      }).innerJoin(r.db('stf').table('testCase'), function (a, b) {
        return a('id').eq(b('id'))

      }).map(function (cs) {
        return {
          id: cs('right')('id'),
          case_name: cs('right')('class_name'),
          logic_id: cs('right')('logic_id'),
          owner: cs('right')('owner'),
          case_desc: cs('right')('doc_string')
        }
      })
    }
  })
  return db.run(query)
}

dbapi.insertDeviceSet = function (data) {
  var query = r.db('stf').table('deviceSet').insert(data)
  return db.run(query)
}

dbapi.getDeviceSet = function () {
  var query = r.db('stf').table('deviceSet').map(function (device) {
    return {
      id: device('id'),
      name: device('name'),
      type: device('type'),
      creator: device('creator'),
      device: device('device').map(function (serial) {
        return {
          serial: serial
        }
      }).eqJoin('serial', r.db('stf').table('devices')).map(function (d) {
        return {
          width: d('right')('display')('width').default(null),
          height: d('right')('display')('height').default(null),
          version: d('right')('version'),
          brand: d('right')('brand').default(d('right')('manufacturer')),
          serial: d('right')('serial')
        }
      })
    }
  })
  return db.run(query)
}

dbapi.deleteDeviceSet = function (condition) {
  var query = r.db('stf').table('deviceSet').filter(condition).delete()
  return db.run(query)
}

dbapi.updateDeviceSet = function (condition, data) {
  var query = r.db('stf').table('deviceSet').filter(condition).update(data)
  return db.run(query)
}

dbapi.updateCaseSet = function (condition, data) {
  log.info(data)
  var query = r.db('stf').table('caseSet').filter(condition).update(data)
  return db.run(query)
}

dbapi.deleteCaseSet = function (condition) {
  var query = r.db('stf').table('caseSet').filter(condition).delete()
  return db.run(query)
}

dbapi.deleteDeviceSet = function (condition) {
  var query = r.db('stf').table('deviceSet').filter(condition).delete()
  return db.run(query)
}

dbapi.updateDeviceSet = function (condition, data) {
  var query = r.db('stf').table('deviceSet').filter(condition).update(data)
  return db.run(query)
}

dbapi.getCaseSetAndDeviceSet = function (caseSet, deviceSet) {
  var queryCaseSet = r.db('stf').table('caseSet').filter({ name: caseSet }).pluck('cases', 'version')
  var queryDeviceSet = r.db('stf').table('deviceSet').filter({ name: deviceSet }).pluck('device')('device').default([])
  var inner = r.do("", function (result) {
    var c = queryCaseSet
    var d = queryDeviceSet
    return {
      version: c('version').default('').coerceTo('array'),
      cases: c('cases').default([]).coerceTo('array'),
      serials: d.coerceTo('array')
    }
  })
  return db.run(inner)
}

dbapi.filterDeviceSet = function (condition) {
  var query = r.db('stf').table('deviceSet')
  if (condition) {
    query = query.filter(condition)
  }
  return db.run(query)
}

dbapi.filterPerform = function (taskid) {
  var query = r.db('stf').table('tasklist').get(taskid).do(function (task) {
    return r.branch(
      task,
      {
        detail: task('detail').map(function (detail) {
          return {
            serial: detail('serial'),
            performance: detail('performance'),
            status: detail('status'),
            // 预留返回的数据
            cases: detail('cases').default([])
          }
        }),
        devices: task('serials').map(function (s) {
          return {
            serial: s
          }
        }).eqJoin('serial', r.db('stf').table('devices')).map(function (device) {
          return {
            serial: device('left')('serial'),
            version: device('right')('version'),
            markName: device('right')('markName').default(''),
            height: device('right')('display')('height'),
            width: device('right')('display')('width'),
            manufacturer: device('right')('manufacturer')

          }
        })
      },
      null
    )
  })
  return db.run(query)
}

dbapi.loadPerformDetail = function (taskid, serial, scene) {
  var query = r.db('stf').table('tasklist').get(taskid)('detail').default([]).filter({ serial: serial })
  return db.run(query)
}

dbapi.modifyCaseStatus = function (taskid, serial, name, targetStatus) {
  var query = r.db('stf').table('tasklist').get(taskid).update({
    detail: r.row('detail').map(function (det) {
      return r.branch(
        det('serial').eq(serial),

        det.merge({
          cases: det('cases').map(function (c) {

            return r.branch(
              c('name').eq(name),
              c.merge({ result: targetStatus }),
              c
            )

          })
        }),
        det
      )
    })
  })
  return db.run(query)
}

module.exports = dbapi
