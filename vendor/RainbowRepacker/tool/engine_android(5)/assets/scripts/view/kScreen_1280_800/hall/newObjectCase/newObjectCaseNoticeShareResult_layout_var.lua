--Created by the QnEditor,do not modify.If not,you will die very nankan!
local MAP = {
	var = {
		Image_hallBack = 1,
		Image_iconFrame = 2,
		Image_icon = 3,
		Image_twoDimensionCodeFrame = 4,
		Image_twoDimensionCode = 5,
		Image_headIconFrame = 6,
		Image_headIcon = 7,
		Text_name = 8,
		Text_id = 9,
		Text_gameName = 10,
		Text_prize_name = 11,
	},
	ui = {
		[1] = {"Image_hallBack"},
		[2] = {"Image_hallBack","Image_iconFrame"},
		[3] = {"Image_hallBack","Image_iconFrame","Image_icon"},
		[4] = {"Image_hallBack","Image_twoDimensionCodeFrame"},
		[5] = {"Image_hallBack","Image_twoDimensionCodeFrame","Image_twoDimensionCode"},
		[6] = {"Image_hallBack","View_PlayerInfo","Image_headIconFrame"},
		[7] = {"Image_hallBack","View_PlayerInfo","Image_headIconFrame","Image_headIcon"},
		[8] = {"Image_hallBack","View_PlayerInfo","Text_name"},
		[9] = {"Image_hallBack","View_PlayerInfo","Text_id"},
		[10] = {"Image_hallBack","View_PlayerInfo","Text_gameName"},
		[11] = {"Image_hallBack","Text_prize_name"},
	},
	func = {
	},
}
return MAP;