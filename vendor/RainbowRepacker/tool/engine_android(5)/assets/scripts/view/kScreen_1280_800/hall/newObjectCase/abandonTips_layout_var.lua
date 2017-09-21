--Created by the QnEditor,do not modify.If not,you will die very nankan!
local MAP = {
	var = {
		ImageBack = 1,
		closeBtn = 2,
		useBtn = 3,
		Button_cancel = 4,
		icon = 5,
		name = 6,
		Text_numOrday = 7,
	},
	ui = {
		[1] = {"ImageBack"},
		[2] = {"ImageBack","closeBtn"},
		[3] = {"ImageBack","Image_bg2","useBtn"},
		[4] = {"ImageBack","Image_bg2","Button_cancel"},
		[5] = {"ImageBack","Image_bg2","View19","iconFrame","icon"},
		[6] = {"ImageBack","Image_bg2","View19","iconFrame","name"},
		[7] = {"ImageBack","Image_bg2","View19","iconFrame","Text_numOrday"},
	},
	func = {
		[1] = "onBindBlankFunc",
		[2] = "oncloseBtnClick",
		[3] = "onBindToUse",
		[4] = "oncloseBtnClick",
	},
}
return MAP;