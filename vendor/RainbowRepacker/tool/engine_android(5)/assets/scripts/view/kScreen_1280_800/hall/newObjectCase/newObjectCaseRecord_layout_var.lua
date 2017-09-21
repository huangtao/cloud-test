--Created by the QnEditor,do not modify.If not,you will die very nankan!
local MAP = {
	var = {
		ImageBack = 1,
		closeBtn = 2,
		View_list_bg = 3,
		View_nothing = 4,
	},
	ui = {
		[1] = {"ImageBack"},
		[2] = {"ImageBack","closeBtn"},
		[3] = {"ImageBack","Image_bg2","View_list_bg"},
		[4] = {"ImageBack","Image_bg2","View_nothing"},
	},
	func = {
		[1] = "onBindBlankFunc",
		[2] = "oncloseBtnClick",
	},
}
return MAP;