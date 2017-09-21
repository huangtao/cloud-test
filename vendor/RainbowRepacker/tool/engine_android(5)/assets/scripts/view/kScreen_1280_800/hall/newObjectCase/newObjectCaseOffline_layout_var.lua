--Created by the QnEditor,do not modify.If not,you will die very nankan!
local MAP = {
	var = {
		ImageBack = 1,
		closeBtn = 2,
		TextView_prizeDes = 3,
		View_list_bg = 4,
		Image_icon = 5,
		Text_title = 6,
		Text_name = 7,
		Text_redeemCode = 8,
		Text_day = 9,
		Text_userId = 10,
	},
	ui = {
		[1] = {"ImageBack"},
		[2] = {"ImageBack","closeBtn"},
		[3] = {"ImageBack","Image_bg","describeFrame","TextView_prizeDes"},
		[4] = {"ImageBack","Image_bg","View_list_bg"},
		[5] = {"ImageBack","Image_bg","iconFrame","Image_icon"},
		[6] = {"ImageBack","Image_bg","iconContent","View49","Text_title"},
		[7] = {"ImageBack","Image_bg","iconContent","View50","Text_name"},
		[8] = {"ImageBack","Image_bg","iconContent","View51","Text_redeemCode"},
		[9] = {"ImageBack","Image_bg","iconContent","View52","Text_day"},
		[10] = {"ImageBack","Image_bg","iconContent","View53","Text_userId"},
	},
	func = {
		[1] = "onBindBlankFunc",
		[2] = "oncloseBtnClick",
	},
}
return MAP;