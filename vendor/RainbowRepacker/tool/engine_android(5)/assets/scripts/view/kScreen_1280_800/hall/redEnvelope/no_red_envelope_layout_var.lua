--Created by the QnEditor,do not modify.If not,you will die very nankan!
local MAP = {
	var = {
		Image_mask = 1,
		Button_close = 2,
		Text_name = 3,
		Text_id = 4,
		View_head_root = 5,
		Button_close2 = 6,
		Button_info = 7,
		CheckBoxGroup_never_get = 8,
		CheckBox_never_get = 9,
	},
	ui = {
		[1] = {"Image_mask"},
		[2] = {"Button_close"},
		[3] = {"Image_bg","Text_name"},
		[4] = {"Image_bg","Text_id"},
		[5] = {"Image_bg","View_head_root"},
		[6] = {"Image_bg","Button_close2"},
		[7] = {"Image_bg","Button_info"},
		[8] = {"CheckBoxGroup_never_get"},
		[9] = {"CheckBoxGroup_never_get","CheckBox_never_get"},
	},
	func = {
		[1] = "onBindToClose",
		[2] = "onBindToClose",
		[6] = "onBindToClose",
		[7] = "onBindInfo",
	},
}
return MAP;