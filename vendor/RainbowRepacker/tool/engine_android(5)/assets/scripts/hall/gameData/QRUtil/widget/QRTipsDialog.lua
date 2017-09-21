local qr_TipsDialog = require("view/kScreen_1280_800/hall/gameData/QRUtil/qr_TipsDialog")

local QRTipsItem = require("hall/gameData/QRUtil/widget/QRTipsItem")
local QRTipsDialog = class(CommonGameLayer, false)

local h_index = 0
local getIndex = function(self)
    h_index = h_index + 1
    return h_index
end

QRTipsDialog.s_controls = 
{
	title = getIndex(),
	closeBtn = getIndex(),
	btn = getIndex(),
	btnText = getIndex(),
	contentView = getIndex(),
	userInfoView = getIndex(),
	exchangeView = getIndex(),

	userInfoHeadBg = getIndex(),
	userInfoName = getIndex(),
	userInfoContent = getIndex(),
	
	exchangeListView = getIndex(),
	exchangeTips = getIndex(),
	exchangeName = getIndex(),
	exchangeId = getIndex(),
	exchangeNoneTips = getIndex(),
}

QRTipsDialog.show = function()
	delete(QRTipsDialog.s_instance)
	QRTipsDialog.s_instance = new(QRTipsDialog)
	QRTipsDialog.s_instance:addToRoot()
	return QRTipsDialog.s_instance
end

QRTipsDialog.hide = function()
	delete(QRTipsDialog.s_instance)
	QRTipsDialog.s_instance = nil
end

QRTipsDialog.ctor = function(self)
	super(self, qr_TipsDialog)
    self:setSize(self.m_root:getSize())
    self:setFillParent(true, true)
    self:setEventDrag(self, self.onEventDragFunc)
    self:setEventTouch(self, self.onEventTouchFunc)
    self.m_ctrl = QRTipsDialog.s_controls

    self.m_btnText = self:findViewById(QRTipsDialog.s_controls.btnText)
    self.m_btn = self:findViewById(QRTipsDialog.s_controls.btn)
    self.m_title = self:findViewById(QRTipsDialog.s_controls.title)
    self.m_userInfoView = self:findViewById(QRTipsDialog.s_controls.userInfoView)
    self.m_exchangeView = self:findViewById(QRTipsDialog.s_controls.exchangeView)
    IPopDialogManager.getInstance():addPopDialog(self, 99, self.onBack, self)
end

QRTipsDialog.dtor = function(self)
	if self.m_callbackObj and self.m_callbackFunc then
		self.m_callbackFunc(self.m_callbackObj)
	end
	self.m_callbackObj = nil
	self.m_callbackFunc = nil
	self.m_data = nil
	ImageCache.getInstance():cleanRef(self)
	IPopDialogManager.getInstance():removePopDialog(self)
end

QRTipsDialog.onBack = function()
	QRTipsDialog.hide()
end

QRTipsDialog.setOnCloseCallBack = function(self,obj,callback)
	self.m_callbackObj = obj
    self.m_callbackFunc = callback
end

QRTipsDialog.setBtnState = function(self, state)
	self.m_btn:setVisible(state)
end

QRTipsDialog.setBtnText = function(self, text)
	self.m_btnText:setText(text)
end

QRTipsDialog.setBtnEnable = function(self, enable)
	self.m_btn:setEnable(enable)
end

QRTipsDialog.setTitle = function(self, text)
	self.m_title:setText(text)
end

QRTipsDialog.onCloseClick = function(self)
	QRTipsDialog.hide()
end

--通用按钮点击事件
QRTipsDialog.onBtnClick = function(self)
	if self.m_onBtnClick then
		self:m_onBtnClick(self.m_data)
	else
		self:onCloseClick()
	end
end

--初始化扫描用户信息窗口
QRTipsDialog.initUserInfo = function(self, isSuccess, info, onBtnClick, onUserInfoUpdateHead)
	self.m_userInfoView:setVisible(true)
	self.m_data = info
	self.m_onBtnClick = onBtnClick
	self.m_userInfoHeadBg = self:findViewById(QRTipsDialog.s_controls.userInfoHeadBg)
    self.m_userInfoName = self:findViewById(QRTipsDialog.s_controls.userInfoName)
    self.m_userInfoContent = self:findViewById(QRTipsDialog.s_controls.userInfoContent)

    local showState = (isSuccess and (not table.isEmpty(info)))
    self:setUserInfoHeadState(showState)
    if showState then
        self:setUserInfoHeadImage(kUserInfoData:getHallHeadBySex(info.sex))
        self:setUserInfoName(info.nickname or "")
        if info.is_friend == 1 then
        	self:setUserInfoContent("该玩家已经是你的好友，不可重复添加！")
        	self:setBtnText("确定")
        else
        	self:setUserInfoContent("是否添加该玩家为好友")
        	self:setBtnText("添加")
        end
        ImageCache.getInstance():request(info.avatar_url, self, onUserInfoUpdateHead)
    else
        self:setUserInfoContent("获取玩家信息失败，请重试。")
        self:setBtnText("确定")
    end
end

QRTipsDialog.setUserInfoName = function(self, text)
	self.m_userInfoName:setText(text)
end

QRTipsDialog.setUserInfoContent = function(self, content)
	self.m_userInfoContent:setText(content)
end

QRTipsDialog.setUserInfoHeadState = function(self, state)
	self.m_userInfoHeadBg:setVisible(state)
	self.m_userInfoName:setVisible(state)
end

QRTipsDialog.setUserInfoHeadImage = function(self, imagePath)
	if self.m_headImage then
		self.m_userInfoHeadBg:removeChild(self.m_headImage)
	end
	delete(self.m_headImage)
	local community_pin_map = require("qnFiles/qnPlist/hall/community_pin")
	self.m_headImage = new(Mask, imagePath, community_pin_map["mask.png"])
	self.m_userInfoHeadBg:addChild(self.m_headImage)
	self.m_headImage:setAlign(kAlignCenter)
end

QRTipsDialog.initExchange = function(self, isSuccess, info)
	if not table.isTable(info) then
		return
	end
	self.m_exchangeView:setVisible(true)
	self.m_data = info
	self.m_exchangeListView = self:findViewById(QRTipsDialog.s_controls.exchangeListView)
    self.m_exchangeTips = self:findViewById(QRTipsDialog.s_controls.exchangeTips)
    self.m_exchangeName = self:findViewById(QRTipsDialog.s_controls.exchangeName)
    self.m_exchangeId = self:findViewById(QRTipsDialog.s_controls.exchangeId)
    self.m_exchangeNoneTips = self:findViewById(QRTipsDialog.s_controls.exchangeNoneTips)
    self:setTitle("奖品兑换")
    self.m_exchangeId:setText(string.format("ID:%s",kUserInfoData:getUserCid()))
    self.m_exchangeName:setText((table.isTable(info.shangjia) and info.shangjia.name) and info.shangjia.name or "")
    self.m_exchangeNoneTips:setText(info.errorTips or "")

	local showState = isSuccess and (not table.isEmpty(info.gcodes))
	self:setExchangeListState(showState)
	if showState then
		if not self.m_exchangeListViewAdapter then
			self.m_exchangeListViewAdapter = new(CacheAdapter, QRTipsItem, info.gcodes)
    		self.m_exchangeListView:setAdapter(self.m_exchangeListViewAdapter)
    	else
    		self.m_exchangeListViewAdapter:changeData(info.gcodes)
    	end
	end
end

QRTipsDialog.setExchangeListState = function(self, state)
	self:setBtnState(not state)
	self.m_exchangeListView:setVisible(state)
	self.m_exchangeTips:setVisible(state)
	self.m_exchangeName:setVisible(state)
	self.m_exchangeId:setVisible(state)
	self.m_exchangeNoneTips:setVisible(not state)
end

QRTipsDialog.updateExchangeItem = function(self, goods_code, info_type, msg)
	info_type = tonumber(info_type)
	local index = self:getExchangeItemIndexByCode(goods_code)
	local item = self:getExchangeItemByIndex(index)
	if not item then
		return
	end
	item:setBtnState((info_type == 2))
	item:setTipsTextState((info_type ~= 2))
	item:setTipsText("")
	if info_type == 0 then --拒绝
		item:setTipsText(msg or "商家取消兑换", 255, 0, 0)
		item:setRefuseTimer()
	elseif info_type == 2 then --同意
		Toast.getInstance():showText("兑换成功！",50,30,kAlginLeft,"",26,255,255,255);
		self:removeExchangeItemByIndex(index)
		self:reloadExchangeListData()
	end
end

QRTipsDialog.onExchangeApply = function(self, goods_code)
	local index = self:getExchangeItemIndexByCode(goods_code)
	local item = self:getExchangeItemByIndex(index)
	if item then
		item:setTipsText("请等待商家确认")
	end
end

QRTipsDialog.getExchangeItemIndexByCode = function(self, goods_code)
	if not self.m_data or type(self.m_data.gcodes) ~= "table" then
		return nil
	end
	for i,v in ipairs(self.m_data.gcodes) do
		if v.goods_code == goods_code then
			return i
		end
	end
	return nil
end

QRTipsDialog.getExchangeItemByIndex = function(self, index)
	if not index or not self.m_exchangeListViewAdapter then
		return nil
	end
	return self.m_exchangeListViewAdapter:getView(index)
end

QRTipsDialog.reloadExchangeListData = function(self)
	if self.m_data and type(self.m_data.gcodes) == "table" and self.m_exchangeListViewAdapter then
		if not table.isEmpty(self.m_data.gcodes) then
			--self.m_exchangeListView:setVisible(true)
			self.m_exchangeListViewAdapter:changeData(self.m_data.gcodes)
		else
			self:setExchangeListState(false)
			self.m_exchangeNoneTips:setText("您的物品箱里暂时没有该商家的兑换券请先确认自己的获奖信息")
		end
	end
end

QRTipsDialog.removeExchangeItemByIndex = function(self, index)
	if not self.m_data or type(self.m_data.gcodes) ~= "table" then
		return
	end
	table.remove(self.m_data.gcodes, index)
end

QRTipsDialog.onEventTouchFunc = function(self)
	
end

QRTipsDialog.onEventDragFunc = function(self)
	
end

QRTipsDialog.s_controlConfig = 
{	
	--通用
	[QRTipsDialog.s_controls.title] = {"contentView", "titleBg", "title"},
	[QRTipsDialog.s_controls.closeBtn] = {"contentView", "closeBtn"},
	[QRTipsDialog.s_controls.btn] = {"contentView", "btn"},
	[QRTipsDialog.s_controls.btnText] = {"contentView", "btn", "text"},
	[QRTipsDialog.s_controls.userInfoView] = {"contentView", "userInfoView"},
	[QRTipsDialog.s_controls.exchangeView] = {"contentView", "exchangeView"},

	--用户信息
	[QRTipsDialog.s_controls.userInfoHeadBg] = {"contentView", "userInfoView", "headBg"},
	[QRTipsDialog.s_controls.userInfoName] = {"contentView", "userInfoView", "name"},
	[QRTipsDialog.s_controls.userInfoContent] = {"contentView", "userInfoView", "content"},

	--商家兑换
	[QRTipsDialog.s_controls.exchangeListView] = {"contentView", "exchangeView", "listView"},
	[QRTipsDialog.s_controls.exchangeTips] = {"contentView", "exchangeView", "tips"},
	[QRTipsDialog.s_controls.exchangeName] = {"contentView", "exchangeView", "name"},
	[QRTipsDialog.s_controls.exchangeId] = {"contentView", "exchangeView", "id"},
	[QRTipsDialog.s_controls.exchangeNoneTips] = {"contentView", "exchangeView", "noneTips"},
}

QRTipsDialog.s_controlFuncMap =
{
	[QRTipsDialog.s_controls.closeBtn] = QRTipsDialog.onCloseClick,
	[QRTipsDialog.s_controls.btn] = QRTipsDialog.onBtnClick,
}

return QRTipsDialog