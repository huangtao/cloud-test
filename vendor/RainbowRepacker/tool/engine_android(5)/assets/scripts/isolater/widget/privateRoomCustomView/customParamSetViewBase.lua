require("common/commonGameLayer");

CustomParamSetViewBase = class(CommonGameLayer, false);

CustomParamSetViewBase.ctor = function(self,data)
	super(self, nil);
	self:setFillParent(true,true);
	self.m_customParamData = {};
	self:initView(data);
end

CustomParamSetViewBase.dtor = function(self)
end

-----------------子类需重写下面这些方法-------------------------------
--返回当前参数是否合法，参数
CustomParamSetViewBase.getCustomParamData = function(self)
	return true,self.m_customParamData;
end

--virtual
CustomParamSetViewBase.initView = function(self,data)
	-- body
end

--virtual
CustomParamSetViewBase.resetParamData = function(self,data)
	self.m_customParamData = {};
	
end