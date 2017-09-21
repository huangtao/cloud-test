--Created by the QnEditor,do not modify.If not,you will die very nankan!
local MAP = {
	var = {
		frameBack = 1,
		iconImageBg = 2,
		numFrameBack = 3,
		numText = 4,
		Image_name = 5,
		Text_name = 6,
		Image_past_day = 7,
		Text_past_day = 8,
	},
	ui = {
		[1] = {"frameBack"},
		[2] = {"frameBack","iconImageBg"},
		[3] = {"numFrameBack"},
		[4] = {"numFrameBack","numText"},
		[5] = {"Image_name"},
		[6] = {"Image_name","Text_name"},
		[7] = {"Image_past_day"},
		[8] = {"Image_past_day","Text_past_day"},
	},
	func = {
		[1] = "onBindToCommonInfo",
	},
}
return MAP;