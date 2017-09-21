

------------------- PropsPageView  --------------------------
--[Comment]
--道具页
local PropsPageView = class(CommonGameLayer, false);
--[Comment]
--道具页构造函数
PropsPageView.ctor = function(self, data)
	super(self, nil);
	self:setSize(440, 105);

	if not data then return; end
	self.m_data = data;
	self:initViews();
end
--[Comment]
--初始化道具页界面
PropsPageView.initViews = function ( self )
	-- body
	for k, v in ipairs(self.m_data) do
		local itemView = require("games/common2/module/playerInfo/propsItemView");
		local propsView = new(itemView, v);
		propsView:setSize(110, 105);								-- 设置道具icon大小
		propsView:setPos((k - 1) * (propsView.m_width - 6), 0);		-- 设置道具icon坐标
		self:addChild(propsView);
	end
end

return PropsPageView;