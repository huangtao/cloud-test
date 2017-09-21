--创建邀请赛操作数据
local InvitationalCreateData = class()


InvitationalCreateData.ctor = function(self)

end

--获取选中的游戏id
InvitationalCreateData.getGameId = function(self)
    return self.game_data and self.game_data.id
end

--获取选中的游戏名字
InvitationalCreateData.getGameName = function(self)
    return self.game_data and self.game_data.name
end

--设置选中的游戏数据
InvitationalCreateData.setGameData = function(self, val)
    self.game_data = val
end

--获取选中的游戏数据
InvitationalCreateData.getGameData = function(self)
    return self.game_data
end

--设置选中的开赛时间
InvitationalCreateData.setTime = function(self, val)
    self.time = val
end

--获取选中的开赛时间
InvitationalCreateData.getTime = function(self)
    return self.time
end

--设置选中的最低开赛人数
InvitationalCreateData.setMinPlayers = function(self, val)
    self.min_players = val
end

--获取选中的最低开赛人数
InvitationalCreateData.getMinPlayers = function(self)
    return self.min_players
end

--设置选中的奖励
InvitationalCreateData.setAward = function(self, val)
    self.award = val
end

--获取选中的奖励
InvitationalCreateData.getAward = function(self)
    return self.award
end

--设置选中的奖励的货币类型
InvitationalCreateData.setAwardType = function(self, val)
    self.award_type = val
end

--获取选中的奖励的货币类型
InvitationalCreateData.getAwardType = function(self)
    return self.award_type
end

--获取选中的获奖名次
InvitationalCreateData.getAwardRanking = function(self)
    return self.ranking_data and self.ranking_data["value"]
end

--获取选中的获奖名次数据类型
InvitationalCreateData.getAwardRankingType = function(self)
    return self.ranking_data and self.ranking_data["type"]
end

--获取选中的获奖名次文字
InvitationalCreateData.getAwardRankingName = function(self)
    return self.ranking_data and self.ranking_data["name"]
end

--设置选中的获奖名次数据
InvitationalCreateData.setAwardRankingData = function(self, val)
    self.ranking_data = val
end

--获取选中的获奖名次数据
InvitationalCreateData.getAwardRankingData = function(self)
    return self.ranking_data
end

--设置奖圈人数
InvitationalCreateData.setAwardCount = function(self, val)
    self.award_count = val
end

--获取奖圈人数
InvitationalCreateData.getAwardCount = function(self)
    return self.award_count
end

--设置选中的报名费用
InvitationalCreateData.setFee = function(self, val)
    self.fee = val
end

--获取选中的报名费用
InvitationalCreateData.getFee = function(self)
    return self.fee
end

--设置选中的报名费用货币类型
InvitationalCreateData.setFeeType = function(self, val)
    self.fee_type = val
end

--获取选中的报名费用货币类型
InvitationalCreateData.getFeeType = function(self)
    return self.fee_type
end

--设置输入的密码
InvitationalCreateData.setPassword = function(self, val)
    self.password = val
end

--获取输入的密码
InvitationalCreateData.getPassword = function(self)
    return self.password
end

--设置比赛名字
InvitationalCreateData.setMatchName = function(self, val)
    self.match_name = val
end

--获取比赛名字
InvitationalCreateData.getMatchName = function(self)
    return self.match_name
end

return InvitationalCreateData