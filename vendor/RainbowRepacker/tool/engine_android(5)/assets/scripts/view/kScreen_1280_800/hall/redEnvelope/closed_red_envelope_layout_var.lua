--Created by the QnEditor,do not modify.If not,you will die very nankan!
local MAP = {
	var = {
		Button_close = 1,
		Text_name = 2,
		Text_id = 3,
		View_head_root = 4,
		Swf_wait = 5,
		Swf_fly = 6,
		Button_info = 7,
		CheckBoxGroup_never_get = 8,
		CheckBox_never_get = 9,
	},
	ui = {
		[1] = {"Button_close"},
		[2] = {"Image_bg","Text_name"},
		[3] = {"Image_bg","Text_id"},
		[4] = {"Image_bg","View_head_root"},
		[5] = {"Image_bg","Swf_wait"},
		[6] = {"Image_bg","Swf_fly"},
		[7] = {"Image_bg","Button_info"},
		[8] = {"CheckBoxGroup_never_get"},
		[9] = {"CheckBoxGroup_never_get","CheckBox_never_get"},
	},
	func = {
		[1] = "onBindToClose",
		[5] = "onBindOpen",
		[7] = "onBindInfo",
	},
}
return MAP;