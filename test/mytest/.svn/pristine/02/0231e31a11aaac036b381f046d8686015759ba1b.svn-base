#coding=utf-8
import os
import threading
import re
import time


class Installer(threading.Thread):
    def __init__(self, interval, apk_path):
        """
        初始化
        :param interval: 间隔多久执行一次检查
        :param apk_path: apk路径
        """
        threading.Thread.__init__(self)
        self.interval = interval
        self.devices_init = []  # 初始化设备列表
        self.devices_now = []  # 当前设备列表
        self.devices_old = []  # 旧的设备列表
        self.adbtools = AdbTools()
        self.__check_devices()
        self.path = apk_path
        self.installing = []  # 正在安装apk的设备列表
        self.diff = []  # 差异化列表，用于判断设备是否有更新

    def run(self):
        while True:
            # print('After %s seconds to check devices.' % (self.interval,))
            time.sleep(self.interval)
            #  安装失败的设备重新安装
            self.__check_install_stats('Failure.log', self.devices_init, False)
            self.__check_install_stats('Failure.log', self.installing, True)
            #  安装成功的移除正在安装的列表
            self.__check_install_stats('Success.log', self.installing, False)

            self.diff = self.__diff_devices()
            if len(self.diff) > 0:
                self.__install()
            self.devices_init = self.devices_now

    def __check_devices(self):
        """
        检查已连接设备列表
        :return:
        """
        self.devices_init = list(self.adbtools.get_devices())

    @staticmethod
    def __check_install_stats(filename, l1, remove):
        """
        检查安装状态
        :return:
        """
        path = os.path.join(os.path.expanduser('~'), filename)
        if os.path.exists(path):
            l = open(path).readlines()
            for i in l:
                if i.strip() in l1:
                    l1.remove(i.strip())
                    if filename == 'Success.log':
                        l.remove(i)
            # 移除相关数据重新写入
            if filename == 'Success.log':
                with open(path, 'w') as f:
                    for i in l:
                        f.write(i)

        if remove and os.path.exists(path):
            os.remove(path)

    def __diff_devices(self):
        """
        设备列表求差集，即有新增的则执行安装
        :return:
        """
        self.devices_now = list(self.adbtools.get_devices())
        if self.devices_now != self.devices_old:
            print('Current devices: %s' % self.devices_now)
            self.devices_old = self.devices_now
        return list(set(self.devices_now).difference(set(self.devices_init)))

    def __install(self):
        """
        安装apk文件，以覆盖安装的形式
        :return:
        """
        for i in self.diff:
            if i not in self.installing:
                self.installing.append(i)
                AdbTools(str(i), self.path).start()


class AdbTools(threading.Thread):
    def __init__(self, device_id='', path=''):
        threading.Thread.__init__(self)
        self.command = ''
        self.device_id = device_id
        self.path = path
        self.__check_adb()
        self.__connection_devices()
        self.model = self.get_device_model()

    def run(self):
        self.install_replace(self.path)

    def __check_adb(self):
        """
        检查adb
        :return:
        """
        adb_path = os.path.join(os.getcwd(), "platform-tools", "adb.exe")
        if os.path.exists(adb_path):
            self.command = adb_path
        else:
            raise EnvironmentError("Adb not found.")

    def __connection_devices(self):
        """
        连接指定设备，单个设备可不传device_id
        :return:
        """
        if self.device_id == "":
            return
        self.device_id = "-s %s" % self.device_id

    def adb(self, args):
        """
        执行adb命令
        :param args:参数
        :return:
        """
        cmd = "%s %s %s" % (self.command, self.device_id, str(args))
        return os.popen(cmd)

    def shell(self, args):
        """
        执行adb shell命令
        :param args:参数
        :return:
        """
        cmd = "%s %s shell %s" % (self.command, self.device_id, str(args))
        return os.popen(cmd)

    def get_devices(self):
        """
        获取设备列表
        :return:
        """
        l = self.adb('devices').readlines()
        return (i.split()[0] for i in l if 'devices' not in i and len(i) > 5)

    def install_replace(self, path):
        """
        覆盖安装apk文件
        :return:
        """
        # adb install 安装错误常见列表
        errors = {'INSTALL_FAILED_ALREADY_EXISTS': '程序已经存在',
                  'INSTALL_DEVICES_NOT_FOUND': '找不到设备',
                  'INSTALL_FAILED_DEVICE_OFFLINE': '设备离线',
                  'INSTALL_FAILED_INVALID_APK': '无效的APK',
                  'INSTALL_FAILED_INVALID_URI': '无效的链接',
                  'INSTALL_FAILED_INSUFFICIENT_STORAGE': '没有足够的存储空间',
                  'INSTALL_FAILED_DUPLICATE_PACKAGE': '已存在同名程序',
                  'INSTALL_FAILED_NO_SHARED_USER': '要求的共享用户不存在',
                  'INSTALL_FAILED_UPDATE_INCOMPATIBLE': '版本不能共存',
                  'INSTALL_FAILED_SHARED_USER_INCOMPATIBLE': '需求的共享用户签名错误',
                  'INSTALL_FAILED_MISSING_SHARED_LIBRARY': '需求的共享库已丢失',
                  'INSTALL_FAILED_REPLACE_COULDNT_DELETE': '需求的共享库无效',
                  'INSTALL_FAILED_DEXOPT': 'dex优化验证失败',
                  'INSTALL_FAILED_DEVICE_NOSPACE': '手机存储空间不足导致apk拷贝失败',
                  'INSTALL_FAILED_DEVICE_COPY_FAILED': '文件拷贝失败',
                  'INSTALL_FAILED_OLDER_SDK': '系统版本过旧',
                  'INSTALL_FAILED_CONFLICTING_PROVIDER': '存在同名的内容提供者',
                  'INSTALL_FAILED_NEWER_SDK': '系统版本过新',
                  'INSTALL_FAILED_TEST_ONLY': '调用者不被允许测试的测试程序',
                  'INSTALL_FAILED_CPU_ABI_INCOMPATIBLE': '包含的本机代码不兼容',
                  'CPU_ABIINSTALL_FAILED_MISSING_FEATURE': '使用了一个无效的特性',
                  'INSTALL_FAILED_CONTAINER_ERROR': 'SD卡访问失败',
                  'INSTALL_FAILED_INVALID_INSTALL_LOCATION': '无效的安装路径',
                  'INSTALL_FAILED_MEDIA_UNAVAILABLE': 'SD卡不存在',
                  'INSTALL_FAILED_INTERNAL_ERROR': '系统问题导致安装失败',
                  'INSTALL_PARSE_FAILED_NO_CERTIFICATES': '文件未通过认证 >> 设置开启未知来源',
                  'INSTALL_PARSE_FAILED_INCONSISTENT_CERTIFICATES': '文件认证不一致 >> 先卸载原来的再安装',
                  'INSTALL_FAILED_INVALID_ZIP_FILE': '非法的zip文件 >> 先卸载原来的再安装',
                  'INSTALL_CANCELED_BY_USER': '需要用户确认才可进行安装',
                  'INSTALL_FAILED_VERIFICATION_FAILURE': '验证失败 >> 尝试重启手机',
                  'DEFAULT': '未知错误'
                  }
        print('%s installing...' % self.model)
        l = self.adb('install -r %s' % (path,)).read()
        if 'Success' in l:
            print('%s install Success' % self.model)
            #  安装记录 >> Devices.log
            with open(os.path.join(os.path.expanduser('~'), 'Devices.log'), 'a') as f:
                f.write(self.model)
                f.write('\n')
            with open(os.path.join(os.path.expanduser('~'), 'Success.log'), 'a') as f:
                f.write(self.device_id.replace('-s ', ''))
                f.write('\n')
        if 'Failure' in l:
            reg = re.compile('\\[(.+?)\\]')
            key = re.findall(reg, l)[0]
            try:
                print('%s install Failure >> %s' % (self.model, errors[key]))
            except KeyError:
                print('%s install Failure >> %s' % (self.model, key))
            with open(os.path.join(os.path.expanduser('~'), 'Failure.log'), 'w') as f:
                f.write(self.device_id.replace('-s ', ''))
        # 中途拔掉了设备，输出为安装成功，才能从正在安装列表中移除
        if l == '':
            with open(os.path.join(os.path.expanduser('~'), 'Success.log'), 'a') as f:
                f.write(self.device_id.replace('-s ', ''))
                f.write('\n')

    def get_device_model(self):
        """
        获取设备型号
        :return:
        """
        return self.shell('getprop ro.product.model').read().strip()


if __name__ == '__main__':
    path = list((f for root, dirs, files in os.walk(os.getcwd()) for f in files if f.endswith('.apk')))[0]
    Installer(5, path).start()
