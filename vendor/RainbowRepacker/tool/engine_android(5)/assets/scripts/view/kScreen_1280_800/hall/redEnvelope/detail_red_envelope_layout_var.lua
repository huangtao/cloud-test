--Created by the QnEditor,do not modify.If not,you will die very nankan!
local MAP = {
	var = {
		Image_mask = 1,
		Button_close = 2,
		Button_back = 3,
		Text_status = 4,
		View_listBottom = 5,
		Text_tip = 6,
		View_congratulation_tip = 7,
		View_chat_left = 8,
		View_chat_right = 9,
	},
	ui = {
		[1] = {"Image_mask"},
		[2] = {"Button_close"},
		[3] = {"Image_bg","Button_back"},
		[4] = {"Image_bg","Text_status"},
		[5] = {"Image_bg","Image14","View_listBottom"},
		[6] = {"Image_bg","Image14","Text_tip"},
		[7] = {"Image_bg","Image14","View_congratulation_tip"},
		[8] = {"View_chat_left"},
		[9] = {"View_chat_right"},
	},
	func = {
		[2] = "onBindToClose",
		[3] = "onBindBack",
	},
}
return MAP;