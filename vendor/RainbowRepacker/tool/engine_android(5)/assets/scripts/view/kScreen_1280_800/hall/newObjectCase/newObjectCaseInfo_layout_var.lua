--Created by the QnEditor,do not modify.If not,you will die very nankan!
local MAP = {
	var = {
		ImageBack = 1,
		closeBtn = 2,
		useBtn = 3,
		btnDescribe = 4,
		Button_sell = 5,
		Text_type_des = 6,
		describeText = 7,
		Text__bindPhoneNumberTip = 8,
		iconFrame = 9,
		icon = 10,
		name = 11,
		Text_numOrday = 12,
	},
	ui = {
		[1] = {"ImageBack"},
		[2] = {"ImageBack","closeBtn"},
		[3] = {"ImageBack","Image_bg2","useBtn"},
		[4] = {"ImageBack","Image_bg2","useBtn","btnDescribe"},
		[5] = {"ImageBack","Image_bg2","Button_sell"},
		[6] = {"ImageBack","Image_bg2","describeFrame","Text_type_des"},
		[7] = {"ImageBack","Image_bg2","describeFrame","describeText"},
		[8] = {"ImageBack","Image_bg2","Text__bindPhoneNumberTip"},
		[9] = {"ImageBack","Image_bg2","View21","iconFrame"},
		[10] = {"ImageBack","Image_bg2","View21","iconFrame","icon"},
		[11] = {"ImageBack","Image_bg2","View21","iconFrame","name"},
		[12] = {"ImageBack","Image_bg2","View21","iconFrame","Text_numOrday"},
	},
	func = {
		[1] = "onBindBlankFunc",
		[2] = "oncloseBtnClick",
		[5] = "onBindToSell",
	},
}
return MAP;