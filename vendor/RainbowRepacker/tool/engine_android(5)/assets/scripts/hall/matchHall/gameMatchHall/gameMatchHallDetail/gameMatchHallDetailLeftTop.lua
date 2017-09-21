local match_hall_detail_left_top_layout = require(ViewPath .. "/hall/matchHall/widget/match_hall_detail_left_top_layout")

-- 比赛详情奖励项上半部分
local GameMatchHallDetailLeftTop = class(CommonGameLayer, false)

local h_index = 0
local getIndex = function(self)
    h_index = h_index + 1
    return h_index
end

GameMatchHallDetailLeftTop.s_controls = 
{

}

GameMatchHallDetailLeftTop.Delegate = {

}

GameMatchHallDetailLeftTop.ctor = function(self, rewardData, icon)
    super(self, match_hall_detail_left_top_layout)
    self.m_data = rewardData
    self.m_icon = icon
    self:_initView()
    self:_initData()
end


GameMatchHallDetailLeftTop._initView = function(self)
    for i = 1, 3 do
        self[string.format("m_bg%s", i)] = self.m_root:getChildByName(string.format("bg%s", i))
        self[string.format("m_rankText%s", i)] = self[string.format("m_bg%s", i)]:getChildByName(string.format("rankText%s", i))
        self[string.format("m_rankItem%s", i)] = self[string.format("m_bg%s", i)]:getChildByName(string.format("rankItem%s", i))
        self[string.format("m_rankText%s", i)]:setScrollBarWidth(0)
    end
end

GameMatchHallDetailLeftTop._initData = function(self)
	if not self.m_data then
		return
	end
	for i,v in ipairs(self.m_data) do
		if i <= 3 then
            self[string.format("m_bg%s", i)]:setVisible(true)
            self[string.format("m_rankText%s", i)]:setText(string.subUtfStrByCn((v.desc or ""),1,11,"..."))
            ImageCache.getInstance():request(self.m_icon[tostring(i)], self, self.onImageDownload, self[string.format("m_rankItem%s", i)])
		end
	end
end

GameMatchHallDetailLeftTop.onImageDownload = function(self, url, file, rankItem)
    if rankItem and not string.isEmpty(file) then
        local w, h = rankItem:getSize()
        rankItem:setFile(file)
        --[[
        if rankItem.m_res then
            local resW = rankItem.m_res:getWidth()
            local resH = rankItem.m_res:getHeight()
            local scaleW, scaleH =  resW / w, resH / h
            local width, height = w, h
            if scaleW > scaleH then
                width = w
                height = resH / scaleW
            else
                width = resW / scaleH
                height = h
            end
            rankItem:setSize(width, height)
        end
        --]]
    end
end


GameMatchHallDetailLeftTop.s_controlConfig =
{   

}

GameMatchHallDetailLeftTop.s_controlFuncMap =
{

}

return GameMatchHallDetailLeftTop