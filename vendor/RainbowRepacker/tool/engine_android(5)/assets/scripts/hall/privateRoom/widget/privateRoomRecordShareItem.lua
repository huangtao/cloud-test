require("uilibs/userMoneyItem");
local privateRoom_pin_map = require("qnFiles/qnPlist/hall/privateRoom_pin")

local PrivateRoomRecordShareItem = class(Node);

PrivateRoomRecordShareItem.ctor = function(self, data, key, propType)
	local privateRoomRecordShareItemLayout = require(ViewPath.."hall/privateRoom/privateRoomRecordShareItemLayout");
	local view = SceneLoader.load(privateRoomRecordShareItemLayout);
	self:addChild(view);

	self:setSize(view:getSize());

	self.m_data = data;
	self.m_view = view;
	self.m_key = key;
	self.m_propType = propType;

	self:_initView();
end

PrivateRoomRecordShareItem.dtor = function(self)
	
end

PrivateRoomRecordShareItem._initView = function(self)
	local bg = self.m_view:getChildByName("bg");
	bg:setFile(self.m_data.mid == kUserInfoData:getUserId() and 
		privateRoom_pin_map["item_bg_user.png"] or privateRoom_pin_map["item_bg.png"]);

	local number = self.m_view:getChildByName("number");
	number:setFile(privateRoom_pin_map[string.format("player_%s.png", self.m_key)]);

	local winer = self.m_view:getChildByName("winer");
	local propNum = tonumber(self.m_data.propNum) or -1;
	winer:setVisible(self.m_key == 1 and propNum > 0);

	local name = self.m_view:getChildByName("name");
	name:setText(self.m_data.nick);

	local winCount = self.m_view:getChildByName("winCount");
	winCount:setText(string.format("胜局：%s", self.m_data.winCount));

	self:_setHeadImage(kUserInfoData:getHeadBySex(self.m_data.sex or 0)); 
	if not string.isEmpty(self.m_data.icon) then
		ImageCache.getInstance():request(self.m_data.icon, self, self._onDownloadHeadImage);
	end

	self:_initScoreView();
end

PrivateRoomRecordShareItem._initScoreView = function(self)
	local scoreView = self.m_view:getChildByName("scoreView");
	local propNum = tonumber(self.m_data.propNum) or -1;
	local propType = tonumber(self.m_propType) or -1;
	local str = string.format("%s", propNum);
	local img = nil;
	if propType == PrivateRoomConstant.PRIVATE_ROOM_TYPE_SCORE then
		str = str.."F";
	else
		img = UIFactory.createImage("isolater/bg_blank.png");
		img:setSize(45, 45);
		local propInfo = table.verify(RechargeDataInterface.getInstance():getGoodInfoByTypeIdWithMap(propType));
        ImageCache.getInstance():request(propInfo.item_icon, self, self._onImageDownload, img);
    end
	
	local isLose = propNum < 0;
	local propNode = new(UserMoneyItem);
	UserMoneyItem.setFilePath(isLose and UserMoneyItem.s_recordLoseNumFilePath or UserMoneyItem.s_recordWinNumFilePath);
	propNode:setNormalMoneyNum(str, 0.7);
 	UserMoneyItem.setFilePath();
	propNode:setAlign(kAlignRight);
	scoreView:addChild(propNode);

 	if img then
 		img:setAlign(kAlignRight);
 		scoreView:addChild(img);
 		local w, _ = img:getSize();
 		propNode:setPos(w);
 	end
end

PrivateRoomRecordShareItem._onDownloadHeadImage = function(self, url, imagePath)
    if imagePath then
       self:_setHeadImage(imagePath);
    end
end

PrivateRoomRecordShareItem._setHeadImage = function (self, image)
    local headView = self.m_view:getChildByName("head");
    if self.m_headImage then
		headView:removeChild(self.m_headImage);
		delete(self.m_headImage);
		self.m_headImage = nil;
	end

	self.m_headImage = new(Mask, image, "hall/common/mask_head_72.png");
	self.m_headImage:setSize(headView:getSize())
	self.m_headImage:setAlign(kAlignCenter);
	headView:addChild(self.m_headImage);
end

PrivateRoomRecordShareItem._onImageDownload = function(self, url, file, iconImg)
    self:_setImageFile(iconImg, file);
end


PrivateRoomRecordShareItem._setImageFile = function(self, img, file)
    if img then
        local w, _ = img:getSize();
        img:setFile(file or "");

        if img.m_res then
            local widthRes = img.m_res:getWidth();
            local heightRes = img.m_res:getHeight();
            local h = heightRes * w / widthRes;
            img:setSize(w, h);
        end
    end
end

return PrivateRoomRecordShareItem;