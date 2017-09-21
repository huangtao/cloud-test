--Created by the QnEditor,do not modify.If not,you will die very nankan!
local MAP = {
	var = {
		ImageBack = 1,
		closeBtn = 2,
		Button_sell = 3,
		Button_sub = 4,
		Button_add = 5,
		Text_num = 6,
		Text_money = 7,
		Image_money = 8,
		iconFrame = 9,
		icon = 10,
		name = 11,
		Text_numOrday = 12,
	},
	ui = {
		[1] = {"ImageBack"},
		[2] = {"ImageBack","closeBtn"},
		[3] = {"ImageBack","Image_bg2","Button_sell"},
		[4] = {"ImageBack","Image_bg2","Image20","Button_sub"},
		[5] = {"ImageBack","Image_bg2","Image20","Button_add"},
		[6] = {"ImageBack","Image_bg2","Image20","Text_num"},
		[7] = {"ImageBack","Image_bg2","Image21","Text_money"},
		[8] = {"ImageBack","Image_bg2","Image21","Image_money"},
		[9] = {"ImageBack","Image_bg2","View23","iconFrame"},
		[10] = {"ImageBack","Image_bg2","View23","iconFrame","icon"},
		[11] = {"ImageBack","Image_bg2","View23","iconFrame","name"},
		[12] = {"ImageBack","Image_bg2","View23","iconFrame","Text_numOrday"},
	},
	func = {
		[1] = "onBindBlankFunc",
		[2] = "oncloseBtnClick",
		[3] = "onBindToSell",
		[4] = "onBindSub",
		[5] = "onBindAdd",
	},
}
return MAP;