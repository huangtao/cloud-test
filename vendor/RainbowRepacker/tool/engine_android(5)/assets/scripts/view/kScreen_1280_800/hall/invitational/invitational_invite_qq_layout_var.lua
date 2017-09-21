--Created by the QnEditor,do not modify.If not,you will die very nankan!
local MAP = {
	var = {
		content = 1,
		titleView = 2,
		contentView = 3,
		inviteBtn = 4,
		tips = 5,
	},
	ui = {
		[1] = {"content"},
		[2] = {"content","titleView"},
		[3] = {"content","contentView"},
		[4] = {"content","contentView","shareQQView","inviteBtn"},
		[5] = {"content","tips"},
	},
	func = {
		[4] = "onShareQQInviteBtnClick",
	},
}
return MAP;