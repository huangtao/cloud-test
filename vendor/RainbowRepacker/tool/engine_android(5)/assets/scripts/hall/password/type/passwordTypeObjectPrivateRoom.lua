require("hall/password/type/passwordTypeObject");
require("hall/gameData/txtMgr");
require("hall/userInfo/data/userInfoData");
require("hall/community/data/communityDataInterface");
require("hall/password/jump/jumpInterfacePrivateRoom");
require("common/messageBox");

local PasswordTypeObjectPrivateRoom = class(PasswordTypeObject);

------------------------口令数据------------------------------
-- virtual 
PasswordTypeObjectPrivateRoom.generateData = function(self)
    local privateRoomInfo = table.verify(kAppData:getCurPrivateRoomInfo());
    local data = {
        table_pw = privateRoomInfo.password;
        requireMoney = privateRoomInfo.requireMoney or 0;
        baseChip = privateRoomInfo.baseChip or 0;
        --lei
        gameId = privateRoomInfo.gameId;
        nick = kUserInfoData:getNickname();
        gameName = kGameManager:getGameName(privateRoomInfo.gameId);
        mid = kUserInfoData:getUserId();
        cid = kUserInfoData:getUserCid();
        tableId = kGameManager:getCurShortTableId();
    };
    return data;
end

-- virtual
PasswordTypeObjectPrivateRoom.analyseData = function(self, data)
    data.table_pw = tostring(data.table_pw or "") or "";
    data.requireMoney = tonumber(data.requireMoney) or 0;
    data.baseChip = tonumber(data.baseChip) or 0;

    data.gameId = tonumber(data.gameId) or 0;
    data.nick = tostring(data.nick or "") or "";
    data.gameName = tostring(data.gameName or "") or "";
    data.mid = tonumber(data.mid) or 0;
    data.cid = tonumber(data.cid) or 0;
    data.tableId = tonumber(data.tableId) or 0;
    return data;
end

------------------------口令弹框------------------------------
-- virtual
PasswordTypeObjectPrivateRoom.showVersion = function(self, isSupported)
    if not isSupported then
        MessageBox.show("更新提醒",  "当前游戏版本过低，更新游戏后才可进入房间！", "确定", nil, true);
    end
end

-- virtual
PasswordTypeObjectPrivateRoom.executeOnShow = function(self, obj, func, sourceType)
	-- 剪贴板口令自动加好友
    if sourceType == PasswordConstants.TYPE_SOURCE_CLIPBOARD then
        local msg = json.encode({add_friend_type = ImSdkConstants.eAddFriendType.AUTO});
        CommunityDataInterface.getInstance():requestAddFriend(self.m_data.cid, msg);
    end

    if obj and func then
        func(obj);
    end

    local enterType = PrivateRoomConstant.ENTER_TYPE_PASSWORD;
    if sourceType == PasswordConstants.TYPE_SOURCE_HTML then
        enterType = PrivateRoomConstant.ENTER_TYPE_HTML;
    elseif sourceType == PasswordConstants.TYPE_SOURCE_QR then
        enterType = PrivateRoomConstant.ENTER_TYPE_QR_CODE;
    end

    JumpInterfacePrivateRoom.getInstance();
    JumpInterfacePrivateRoom.getInstance():enterPrivateRoom(self.m_data, nil, nil, enterType);
    JumpInterfacePrivateRoom.releaseInstance();
end

------------------------邀请弹框------------------------------
-- virtual
PasswordTypeObjectPrivateRoom.shareByWechat = function(self, password, isShareSwitchOpen)
    if isShareSwitchOpen then
        local wechatData = table.verify(self:_getShareContentWechat(password));
        if not table.isEmpty(wechatData) then
            WeixinShareUtil.getInstance():weixinSendWebPageWithPassword(password, wechatData.url, wechatData.title, wechatData.desc, wechatData.share_icon, false);
        end
    else
        local text = self:_getShareContentText(password);
        if not string.isEmpty(text) then
            PasswordDataInterface.getInstance():setTextToClipboard(text);
            WeixinShareUtil.getInstance():openWeiXin();
        end
    end
end

-- virtual
PasswordTypeObjectPrivateRoom.shareByQQ = function(self, password)
    local text = self:_getShareContentText(password);
    if not string.isEmpty(text) then
        PasswordDataInterface.getInstance():setTextToClipboard(text);
        WeixinShareUtil.getInstance():openQQ();
    end
end

-- virtual
PasswordTypeObjectPrivateRoom.shareByMessage = function(self, password, hasContact)
    local text = self:_getShareContentText(password);
    if not string.isEmpty(text) and not hasContact then
        PasswordDataInterface.getInstance():openSms(text);
    end
    return text;
end

-- virtual
PasswordTypeObjectPrivateRoom.shareByQr = function(self, password)
    local qrType = QRUtil.eQRType.PRIVATE_ROOM;
    local wechatUrl = self:_getShareContentQr(password, qrType);
    return qrType, wechatUrl;
end

------------------------------------private-----------------------------------------
PasswordTypeObjectPrivateRoom._getShareContentText = function(self, password)
    local privateRoomInfo = table.verify(kAppData:getCurPrivateRoomInfo());
    local content = table.verify(TxtMgr.getInstance():getDescByKey("token_content_format"));
    local urlMap = table.verify(content.url);
    local region = kClientInfo:getRegionId();
    local url = urlMap[tostring(region) or ""] or "";
    local shareText = "{app}【{game}】约牌房。房号：{tableId}，长按→复制这条消息，打开 {url} 跟我一起玩！{token}";
    
    local appName = RegionConfigDataInterface.getInstance():getRegionProductName();
    local gameName = kGameManager:getGameName(privateRoomInfo.gameId);
    local tableId = kGameManager:getCurShortTableId();
    shareContent = string.gsub(shareText, "{game}", gameName or "");
    shareContent = string.gsub(shareContent, "{tableId}", string.format("%.4d", tableId or 0));
    shareContent = string.gsub(shareContent, "{token}", password or "");
    shareContent = string.gsub(shareContent, "{app}", appName);
    shareContent = string.gsub(shareContent, "{url}", url);

    Log.d("PasswordTypeObjectPrivateRoom._getShareContentText", shareContent);
    return shareContent;
end

PasswordTypeObjectPrivateRoom._getShareContentWechat = function(self, password)
    local privateRoomInfo = table.verify(kAppData:getCurPrivateRoomInfo());
    local appName = RegionConfigDataInterface.getInstance():getRegionProductName();
    local gameName = kGameManager:getGameName(privateRoomInfo.gameId);
    local tableId = kGameManager:getCurShortTableId();
    local tableType = privateRoomInfo.tableType or 0;
    local tableTypeName = PrivateRoomConstant.UNIT_MAP[tableType] or "";
    local shareTempleData = table.verify(ShareDataInterface.getInstance():getShareTemplate());
    local weiChatInfo = table.verify(shareTempleData.df_info);

    local playerNumer = PlayerSeat.getInstance():getCurGamePlayerMaxCount();
    local playerCurrent = GamePlayerManager2.getInstance():getPlayerSize();

    local titleStr = "邀你玩《{game}》房号【{tableId}】，{playerCurrent}缺{playerNeed}，速度加入牌局！";
    titleStr = string.gsub(titleStr, "{game}", gameName or "");
    titleStr = string.gsub(titleStr, "{tableId}", string.format("%.4d", tableId or 0));
    titleStr = string.gsub(titleStr, "{playerCurrent}", playerCurrent);
    titleStr = string.gsub(titleStr, "{playerNeed}", playerNumer - playerCurrent);

    local subTitle = ShareDataInterface.getInstance():getPrivateRoomShareSubTitle();
    local descStr = subTitle;

    if string.isEmpty(descStr) then
        descStr = "共{roundsTotal}局，底注：{baseChip} -- {app}《{game}》，最多人玩的游戏";
        descStr = string.gsub(descStr, "{roundsTotal}", privateRoomInfo.rounds or 1);
        descStr = string.gsub(descStr, "{baseChip}", string.format("%s%s", privateRoomInfo.baseChip or 0, tableTypeName));
        descStr = string.gsub(descStr, "{app}", appName);
        descStr = string.gsub(descStr, "{game}", gameName or "");
    end

    local wechatUrl = string.format("%s?action=h5.privateroomshare", ServerConfig.getInstance():getHostUrl() or "");
    if not string.isEmpty(wechatUrl) then
        local urlParam = {
            -- gameId = privateRoomInfo.gameId,
            -- playerCurrent = playerCurrent,
            -- playerNeed = playerNumer - playerCurrent,
            -- tableType = privateRoomInfo.tableType,
            -- playerList = self:_getPalyerList(),
            -- tableId = tableId,
        }

        -- local extParams = privateRoomInfo.extParams;
        -- if not string.isEmpty(extParams) then
        --     for k, v in pairs(table.verify(json.decode(extParams))) do
        --         if k and v then
        --             urlParam[k] = v;
        --         end
        --     end
        -- end

        for k, v in pairs(urlParam) do
            if k and v then
                local strFormat = "%s&%s=%s";
                if string.endsWith(wechatUrl, "?") then
                    strFormat = "%s%s=%s"
                end
                wechatUrl = string.format(strFormat, wechatUrl, string.valueOf(k), string.valueOf(v));
            end
        end
    end
    
    local data = {
        url = wechatUrl,
        title = titleStr,
        desc = descStr,
        share_icon = weiChatInfo.share_icon or "",
    }

    Log.d("PasswordTypeObjectPrivateRoom._getShareContentWechat", data.url, data.title, data.desc);
    return data;
end

PasswordTypeObjectPrivateRoom._getShareContentQr = function(self, password, qrType)
    local wechatUrl = string.format("%s?action=h5.privateroomshare", ServerConfig.getInstance():getHostUrl() or "");
    if not string.isEmpty(wechatUrl) then
        local urlParam = {
            tableId = kGameManager:getCurShortTableId(),
        }

        for k, v in pairs(urlParam) do
            if k and v then
                local strFormat = "%s&%s=%s";
                if string.endsWith(wechatUrl, "?") then
                    strFormat = "%s%s=%s"
                end
                wechatUrl = string.format(strFormat, wechatUrl, string.valueOf(k), string.valueOf(v));
            end
        end
    end
    
    local url = PasswordDataInterface.getInstance():generateUrlWithPasswordAndQrType(wechatUrl, password, qrType);
    Log.d("PasswordTypeObjectPrivateRoom._getShareContentQr", url);
    return url;
end

PasswordTypeObjectPrivateRoom._getPalyerList = function(self)
    local playerList = {};
    local playerInfoList = GamePlayerManager2.getInstance():getAllPlayer();
    for k, v in pairs(table.verify(playerInfoList)) do
        if v then
            local mid = v:getMid();
            local cid = v:getCid();
            local icon = v:getAvatar();
            local player = {
                mid = string.isEmpty(icon) and 0 or mid,
                cid = string.isEmpty(icon) and 0 or cid,
                sex = v:getSex(),
                nick = v:getNick(),
            }
            table.insert(playerList, player);
        end
    end
    return json.encode(playerList);
end

return PasswordTypeObjectPrivateRoom;
