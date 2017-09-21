--Created by the QnEditor,do not modify.If not,you will die very nankan!
local MAP = {
	var = {
		Image_shiled = 1,
		ImageBack = 2,
		View_bagBlank = 3,
		View_content_bag = 4,
		Button_record = 5,
	},
	ui = {
		[1] = {"Image_shiled"},
		[2] = {"ImageBack"},
		[3] = {"ImageBack","Image_bg2","View_bagBlank"},
		[4] = {"ImageBack","Image_bg2","View_content_bag"},
		[5] = {"ImageBack","Button_record"},
	},
	func = {
		[2] = "onBindBlankFunc",
		[5] = "onBindToRecord",
	},
}
return MAP;