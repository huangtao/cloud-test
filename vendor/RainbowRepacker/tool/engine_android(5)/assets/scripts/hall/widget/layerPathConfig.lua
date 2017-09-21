-- 这个文件用来存放所有的layerManagerIsolater管理的界面的名字和路径

local config = {};
--举报
config["commonReport"] = "hall/report/gameReportView";												--举报
--物品箱
config["case_general_use"] = "hall/backpack/widget/popWnd/InfoWidgetGeneral";                       --新物品——一般物品--公共信息界面
config["case_giftBag_use"] = "hall/backpack/widget/popWnd/InfoWidgetGiftBag";						--新物品——礼包--公共信息界面
config["case_offline_use"] = "hall/backpack/widget/popWnd/InfoWidgetOffline";						--新物品——线下物品--公共信息界面
config["case_onlineEntity_use"] = "hall/backpack/widget/popWnd/InfoWidgetOnlineEntity";				--新物品——线上实物--公共信息界面
config["case_onlineVirtual_use"] = "hall/backpack/widget/popWnd/InfoWidgetOnlineVirtual";			--新物品——话费--公共信息界面
config["case_shard_use"] = "hall/backpack/widget/popWnd/InfoWidgetShard";							--新物品——碎片--公共信息界面
config["case_detail_offline"] = "hall/backpack/widget/popWnd/DetailWidgetOffline";					--新物品——线下实物--详细信息界面
config["case_detail_online_entity"] = "hall/backpack/widget/popWnd/DetailWidgetOnlineEntity";		--新物品——线上实物--详细信息界面
config["case_detail_online_virtual"] = "hall/backpack/widget/popWnd/DetailWidgetOnlineVirtual";		--新物品——话费--详细信息界面
config["case_congratulation"] = "hall/backpack/widget/popWnd/NoticeForRecord";						--新物品——线上实物--线上物品领奖时恭喜界面
config["case_orderShow"] = "hall/backpack/widget/popWnd/OrderShow";									--新物品——订单号复制
config["case_Share_Notice"] = "hall/backpack/widget/popWnd/ShareNotice";							--新物品——引导分享界面
config["case_Share_Result"] = "hall/backpack/widget/popWnd/ShareResult";							--新物品——分享截屏时的界面
config["case_abandonTips"] = "hall/backpack/widget/popWnd/GeneralAbandonTip";						--新物品——丢弃物品时二次确认
--物品箱 2017/1/4新加
config["case_list_ui"] = "hall/backpack/backpackList";												--新物品——物品列表界面
config["case_record_ui"] = "hall/backpack/backpackRecord";											--新物品——物品记录界面
config["case_sell_object"] = "hall/backpack/widget/popWnd/backpackSellObject";						--新物品——物品回兑详情界面
config["case_detail_shard"] = "hall/backpack/widget/popWnd/DetailCompound";							--新物品——物品合成详情界面

--金条兑换
config["goldBar"] = "hall/goldBar/widget/goldBarLayer";												--金条
--红包
config["redenvelope_config"] = "hall/redEnvelope/widget/RedEnvelopeConfigLayer";					--发红包
config["redenvelope_anim_send"] = "hall/redEnvelope/widget/animSend";								--发红包动画
config["redenvelope_record"] = "hall/redEnvelope/widget/RedEnvelopeRecordLayer";					--发红包记录
config["redenvelope_detail"] = "hall/redEnvelope/widget/RedEnvelopeDetailLayer";					--红包领取详情
config["redenvelope_reciever"] = "hall/redEnvelope/widget/RedEnvelopeRecieverLayer";				--抢红包浮标
config["redenvelope_get"] = "hall/redEnvelope/widget/RedEnvelopeGetLayer";							--抢到红包
config["redenvelope_congratulation"] = "hall/redEnvelope/widget/RedEnvelopeCongratulationLayer";	--开红包成功
config["redenvelope_fail"] = "hall/redEnvelope/widget/RedEnvelopeFailLayer";						--开红包失败
--浮标
config["floatBallDisk"] = "hall/floatBall/floatBallDisk";											--浮标
--道具购买提示界面
config["shop_gold_pay_info"] = "hall/shortCutRecharge/widget/rechargePropLayer";					--商店购买道具提示信息


--自建赛
config["InvitationalSlideInvite"] = "hall/invitational/widget/invitationalSlideInvite";             --自建赛邀请弹框
config["InvitationalSlideConfirm"] = "hall/invitational/widget/invitationalSlideConfirm";           --自建赛创建确认弹框
config["InvitationalSlideRule"] = "hall/invitational/widget/invitationalSlideRule";                 --自建赛规则弹框
config["InvitationalSlideCommon"] = "hall/invitational/widget/invitationalSlideCommon";             --自建赛选择公共弹框
config["InvitationalCalendar"] = "hall/invitational/widget/invitationalCalendar";                   --自建赛选择开赛时间弹框
config["InvitationalSlideKeyboard"] = "hall/invitational/widget/invitationalSlideKeyboard";         --自建赛密码输入弹框
config["InvitationalSlideRanking"] = "hall/invitational/widget/invitationalSlideRanking";           --自建赛排行榜
config["InvitationalSlideInviteQr"] = "hall/invitational/widget/invitationalSlideInviteQr";         --自建赛邀请二维码弹框
config["InvitationalSlideInviteQQ"] = "hall/invitational/widget/invitationalSlideInviteQQ";         --自建赛邀请QQ弹框

return config;