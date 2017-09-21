--Created by the QnEditor,do not modify.If not,you will die very nankan!
local MAP = {
	var = {
		View_address = 1,
		View_address_bg = 2,
		View_phone = 3,
		Text_phoneNum = 4,
		Image_line = 5,
	},
	ui = {
		[1] = {"View_address"},
		[2] = {"View_address","View_address_bg"},
		[3] = {"View_phone"},
		[4] = {"View_phone","Text_phoneNum"},
		[5] = {"Image_line"},
	},
	func = {
		[3] = "onBindToCall",
	},
}
return MAP;