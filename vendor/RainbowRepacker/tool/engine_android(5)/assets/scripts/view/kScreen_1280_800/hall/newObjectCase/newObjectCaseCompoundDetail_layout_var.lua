--Created by the QnEditor,do not modify.If not,you will die very nankan!
local MAP = {
	var = {
		ImageBack = 1,
		closeBtn = 2,
		View_compound_bg = 3,
		iconFrame = 4,
		icon = 5,
		name = 6,
		Text_numOrday = 7,
	},
	ui = {
		[1] = {"ImageBack"},
		[2] = {"ImageBack","closeBtn"},
		[3] = {"ImageBack","Image_bg2","View_compound_bg"},
		[4] = {"ImageBack","Image_bg2","View14","iconFrame"},
		[5] = {"ImageBack","Image_bg2","View14","iconFrame","icon"},
		[6] = {"ImageBack","Image_bg2","View14","iconFrame","name"},
		[7] = {"ImageBack","Image_bg2","View14","iconFrame","Text_numOrday"},
	},
	func = {
		[1] = "onBindBlankFunc",
		[2] = "oncloseBtnClick",
	},
}
return MAP;