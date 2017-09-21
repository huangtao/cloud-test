require("common/commonGameLayer");

--[[
    房间列表界面基类，具体游戏如果需要自定义自己的房间列表
    则需要继承此类，如果游戏不需要自定义，则会使用默认的。
]]

GameLevelListViewBase = class(CommonGameLayer, false);

GameLevelListViewBase.s_eventItemClick = EventDispatcher.getInstance():getUserEvent();

GameLevelListViewBase.ctor = function(self)
    super(self, nil);

    kGameManager:setObserver(self);
    EventDispatcher.getInstance():register(GameLevelListViewBase.s_eventItemClick, self, self.onGameLevelItemClick);
end

GameLevelListViewBase.dtor = function(self)
    kGameManager:clearObserver(self);
    EventDispatcher.getInstance():unregister(GameLevelListViewBase.s_eventItemClick, self, self.onGameLevelItemClick);
end

------------------------------------------------------------------------------------------------------
--virtual
--@brief 刷新游戏列表
GameLevelListViewBase.refreshRoomLevelList = function(self)
    --body
end

-----------------------------------------------------------------------------------------------------
--@brief 显示游戏房间列表
GameLevelListViewBase.show = function(self, gameId, levelList)
    if not gameId or table.isEmpty(levelList) then
        return;
    end

    self.m_gameId = gameId;
    self.m_levelList = levelList;
    self:refreshRoomLevelList();    
end

--@delegate 房间等级列表回调
GameLevelListViewBase.onGetGameLevelListCallBack = function(self, isSuccess, levelList)
    if isSuccess then
        self.m_levelList = levelList;
        self:refreshRoomLevelList();
    end
end

--@brief 游戏等级item点击事件
GameLevelListViewBase.onGameLevelItemClick = function(self, levelData, gameExtParam)
    Toast.getInstance():hidden();
    if levelData and levelData.gameId and levelData.levelId then
        UBReport.getInstance():report(UBConfig.kEveryGameId, string.format("gameId%s_levelId%s", levelData.gameId, levelData.levelId));
    end
    
    if self:canEnterRoom(levelData, gameExtParam) then
        local data = { id = self.m_gameId, levelId = levelData.levelId };
        EventDispatcher.getInstance():dispatch(HallController.s_eventGoToGameDirect, data, false, gameExtParam)
    end
end

--@brief 钱不够进游戏、弹充值提示框
--@param difMoney：需要购买多少银币
GameLevelListViewBase.__payMoneyToGame = function(self, levelId, difMoney)
    local data = {
        id = self.m_gameId;
        levelId = number.valueOf(levelId);
        difMoney = number.valueOf(difMoney);
    };

    if data and data.id and data.levelId then
        UBReport.getInstance():report(UBConfig.kHallChooseRoomPayLayout, string.format("id%s_levelId%s", data.id, data.levelId));
    end
    IBaseDialog.pushDialog(new(require("hall/main/widget/chooseRoomPayLayer"), data));
end

--@brief 从保险箱取钱进入房间
--@param getMoney：需要取出多少银币
GameLevelListViewBase.__takeOutMoneyToGame = function(self, levelId, getMoney, moneyId, gameExtParam)
    local data = {
        id = self.m_gameId;
        levelId = number.valueOf(levelId);
        getMoney = number.valueOf(getMoney);
        moneyId = moneyId;
        gameExtParam = gameExtParam;
    }

    if data and data.id and data.levelId then
        UBReport.getInstance():report(UBConfig.kHallSafeBoxGetMoneyLayout, string.format("id%s_levelId%s", data.id, data.levelId));
    end
    IBaseDialog.pushDialog(new(require("hall/main/widget/getMoneyToGameView"), data));
end

--@brief 从保险箱存钱进入房间
--@param saveMoney: 需要存多少银币
--@param maxMoney: 场次银币上限
GameLevelListViewBase.__saveMoneyToGame = function(self, levelId, saveMoney, maxMoney, moneyId, gameExtParam)
    local data = {
        id = self.m_gameId;
        levelId = number.valueOf(levelId);
        saveMoney = number.valueOf(saveMoney);
        maxMoney = number.valueOf(maxMoney);
        moneyId = moneyId; 
        gameExtParam = gameExtParam;
    }
    IBaseDialog.pushDialog(new(require("hall/main/widget/saveMoneyToGameView"), data));
end

--去金条场升场提示
GameLevelListViewBase.__toHighLevel = function(self, levelId, saveMoney, maxMoney, gameExtParam)
    local data = {
        id = self.m_gameId;
        levelId = number.valueOf(levelId);
        saveMoney = number.valueOf(saveMoney);
        maxMoney = number.valueOf(maxMoney); 
        moneyId = UserPropertyIsolater.getInstance():getPropertyGoldBarID();
        gameExtParam = gameExtParam;
    }
    IBaseDialog.pushDialog(new(require("hall/main/widget/saveMoneyToGameView"), data));
end

--@brief 计算需要取出多少银币
--@param minMoney：场次银币下限
--@param maxMoney: 场次银币上限
--@param money：用户现金
--@param totalMoney：用户总银币
GameLevelListViewBase.__calTakeOutHowMuchMoney = function (self, minMoney, maxMoney, money, totalMoney)
    local getMoney = 2*minMoney - money; 
    getMoney = math.min(getMoney, totalMoney-money);--不能超过保险箱中的银币
    if maxMoney ~= -1 then
        getMoney = math.min(getMoney, maxMoney-money-1);--不能超过银币上限(前闭后开)
    end
    return getMoney;
end

--@brief 计算需要存多少银币
--@param minMoney：场次银币下限
--@param maxMoney: 场次银币上限
--@param money：用户现金
GameLevelListViewBase.__calSaveHowMuchMoney = function(self, minMoney, maxMoney, money)
    local saveMoney = math.ceil(money - (minMoney+maxMoney)/2);
    return saveMoney;
end


--判断是否能进行游戏
--@ param gameExtParam 子游戏进房间扩展参数（server会做解析，这里只是透传）
GameLevelListViewBase.canEnterRoom = function(self, levelData, gameExtParam)
    if table.isEmpty(levelData) then
        return false;
    end

    local levelId = number.valueOf(levelData.levelId);
    local minMoney = number.valueOf(levelData.minMoney);
    local maxMoney = number.valueOf(levelData.maxMoney, -1);
    local moneyId = number.valueOf(levelData.base_chip_type, 0);
    local gameId = levelData.gameId;

    local money = kUserInfoData:getMoneyById(moneyId);
    local totalMoney = kUserInfoData:getMoneyById(moneyId,true);

    local propertyId = RechargeDataInterface.getInstance():getPropertySilverCoinID();
    if moneyId == propertyId and kBankruptDataInterface:isMineBankrupt() then
        self:__popBankruptWnd();
        return false;
    end

    if money < minMoney and totalMoney >= minMoney then

        --需要取出银币才能进入房间
       local getMoney = self:__calTakeOutHowMuchMoney(minMoney, maxMoney, money, totalMoney);
       self:__takeOutMoneyToGame(levelId, getMoney, moneyId, gameExtParam)
       return false;

    elseif totalMoney < minMoney then

        

        --需要购买银币才能进入房间
        self:__payMoneyToGame(levelId,  minMoney - money);
        return false;

    elseif maxMoney ~= -1 and money > maxMoney then
        local saveMoney = self:__calSaveHowMuchMoney(minMoney, maxMoney, money);
        self:__saveMoneyToGame(levelId, saveMoney, maxMoney, moneyId, gameExtParam);
        return false;
   
    else
        return true;
    end
end

--@brief 判断是否能直接进行游戏
GameLevelListViewBase.canFastEnterRoom = function(self)
    if table.isEmpty(self.m_levelList) then
        return false;
    end

    local levelData = self:__getMinLevelData();
    local levelId = number.valueOf(levelData.levelId);
    local minMoney = number.valueOf(levelData.minMoney);
    local maxMoney = number.valueOf(levelData.maxMoney);
    local moneyId = number.valueOf(levelData.base_chip_type,0);

    local money = kUserInfoData:getMoneyById(moneyId);
    local totalMoney = kUserInfoData:getMoneyById(moneyId,true);

    local propertyId = RechargeDataInterface.getInstance():getPropertySilverCoinID();
    if moneyId == propertyId and kBankruptDataInterface:isMineBankrupt() then
        self:__popBankruptWnd();
        return false;
    end

    if money < minMoney and totalMoney >= minMoney then

        --需要取出银币才能进入房间
       local getMoney = self:__calTakeOutHowMuchMoney(minMoney, maxMoney, money, totalMoney);
       self:__takeOutMoneyToGame(levelId, getMoney, moneyId)
       return false;

    elseif totalMoney < minMoney then
        --需要购买银币才能进入房间
        self:__payMoneyToGame(levelId,  minMoney - money);
        return false;

    else
        return true;
    end
end

GameLevelListViewBase.__popBankruptWnd = function(self)
    if not kLoginDataInterface:getIsLoginSuccess() then
        return;
    end 
    
    if kBankruptDataInterface:isMineBankrupt() and not kBankruptDataInterface:isHaveDialog() then
        require("hall/bankrupt/bankruptDialog");
        local _bankruptDialog = new(BankruptDialog);
        IBaseDialog.pushDialog(_bankruptDialog);
    end
end

--@brief 获取银币区间最小的场次
GameLevelListViewBase.__getMinLevelData = function(self)
    local minLevelData = self.m_levelList[1];
    local minMoney = self.m_levelList[1].minMoney;
    for k, v in pairs(self.m_levelList) do
        if number.valueOf(minMoney) > number.valueOf(v.minMoney) then
            minMoney = v.minMoney;
            minLevelData = v;
        end
    end
    return minLevelData;
end
