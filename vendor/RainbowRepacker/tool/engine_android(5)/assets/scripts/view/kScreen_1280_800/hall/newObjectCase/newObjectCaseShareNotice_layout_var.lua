--Created by the QnEditor,do not modify.If not,you will die very nankan!
local MAP = {
	var = {
		ImageBack = 1,
		closeBtn = 2,
		View_clientPhone = 3,
		View_phoneNumber = 4,
		Button_share_friend = 5,
		Button_share_circle = 6,
		View_icon_bg = 7,
		Text_congratulation = 8,
	},
	ui = {
		[1] = {"ImageBack"},
		[2] = {"ImageBack","closeBtn"},
		[3] = {"ImageBack","Image_bg2","View_clientPhone"},
		[4] = {"ImageBack","Image_bg2","View_clientPhone","View_phoneNumber"},
		[5] = {"ImageBack","Image_bg2","Button_share_friend"},
		[6] = {"ImageBack","Image_bg2","Button_share_circle"},
		[7] = {"ImageBack","Image_bg2","Image39","View_icon_bg"},
		[8] = {"ImageBack","Image_bg2","Text_congratulation"},
	},
	func = {
		[1] = "onBindBlankFunc",
		[2] = "close",
		[3] = "onBindToCallPhone",
		[5] = "onBindToShareFried",
		[6] = "onBindToCircle",
	},
}
return MAP;