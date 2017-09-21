local aboutus_map = require("qnFiles/qnPlist/hall/aboutus");
local record_envelope_qn_pin_map = require("qnFiles/qnPlist/hall/record_envelope_qn_pin");

local qn_res_map = {
	aboutus_nor = aboutus_map["aboutus_nor.png"],
	chat_bottom_left = "hall/common/chat_bottom_left.png",
	chat_bottom_right = "hall/common/chat_bottom_right.png",
	iso_crystal = "isolater/crystal.png",
	iso_gold = "isolater/gold.png",
	redEnvelopeGold = record_envelope_qn_pin_map["red_envelope_gold .png"],
	red_envelope_congratulation1 = record_envelope_qn_pin_map["red_envelope_congratulation1.png"],
	red_envelope_congratulation2 = "hall/redEnvelope/red_envelope_congratulation2.png",
	red_envelope_congratulation3 = record_envelope_qn_pin_map["red_envelope_congratulation3.png"],
	red_envelope_congratulation4 = record_envelope_qn_pin_map["red_envelope_congratulation4.png"],
	red_envelope_goldBar = record_envelope_qn_pin_map["red_envelope_goldBar.png"],
}
return qn_res_map;