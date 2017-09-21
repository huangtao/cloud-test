--Created by the QnEditor,do not modify.If not,you will die very nankan!
local MAP = {
	var = {
		Button_selected = 1,
		Text_num = 2,
		Image_congratulation = 3,
		Image_gold_icon = 4,
		Text_gold_num = 5,
	},
	ui = {
		[1] = {"Button_selected"},
		[2] = {"Button_selected","Text_num"},
		[3] = {"Button_selected","Image_congratulation"},
		[4] = {"Button_selected","View5","Image_gold_icon"},
		[5] = {"Button_selected","View5","Text_gold_num"},
	},
	func = {
		[1] = "onBindToSelected",
	},
}
return MAP;