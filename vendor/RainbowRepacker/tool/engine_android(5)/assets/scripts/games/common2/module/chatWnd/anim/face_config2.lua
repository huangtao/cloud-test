require(RoomChatConfig.s_chatPathPrefix.."res/expressionRes_map2");
require(RoomChatConfig.s_chatPathPrefix.."res/vip_expressions_map2");
require(RoomChatConfig.s_chatPathPrefix.."res/faceq_res2");
require(RoomChatConfig.s_chatPathPrefix.."res/vip_faceq_res2");

faceConfig2 = {
	[1] = {
		["expIconNamePrefix"] = "expression"; 		--显示在表情框中的表情按钮的图片名字的前缀
		["expIconResMap"] = faceq_res_map2;    --显示在表情框中的表情按钮拼图
		["expAnimNamePrefix"] = "expression";	--播放的表情图片的名字前缀
		["expAnimResMap"] = expression_res_map2;	--播放的表情图片的存储路径或拼图		 
		 [1] = {["imgCount"] = 2;	["playCount"] = 7;	["ms"] = 300;};
		 [2] = {["imgCount"] = 8;	["playCount"] = 2;	["ms"] = 1000;};
		 [3] = {["imgCount"] = 9;	["playCount"] = 2;	["ms"] = 1000;};
		 [4] = {["imgCount"] = 2;	["playCount"] = 7;	["ms"] = 300;};
		 [5] = {["imgCount"] = 2;	["playCount"] = 7;	["ms"] = 300;};
		 [6] = {["imgCount"] = 8;	["playCount"] = 2;	["ms"] = 1000;};
		 [7] = {["imgCount"] = 6;	["playCount"] = 2;	["ms"] = 900;};
		 [8] = {["imgCount"] = 9;	["playCount"] = 2;	["ms"] = 1000;};
		 [9] = {["imgCount"] = 3;	["playCount"] = 5;	["ms"] = 450;};
		[10] = {["imgCount"] = 4;	["playCount"] = 4;	["ms"] = 600;};
		[11] = {["imgCount"] = 12;	["playCount"] = 1;	["ms"] = 2000;};
		[12] = {["imgCount"] = 4;	["playCount"] = 3;	["ms"] = 600;};
		[13] = {["imgCount"] = 4;	["playCount"] = 4;	["ms"] = 600;};
		[14] = {["imgCount"] = 14;	["playCount"] = 4;	["ms"] = 1000;};
		[15] = {["imgCount"] = 5;	["playCount"] = 4;	["ms"] = 500;};
		[16] = {["isSwf"] = true;["swfInfoPath"] = RoomChatConfig.s_chatPathPrefix.."res/bainian_swf_info";["swfPinPath"] = RoomChatConfig.s_chatPathPrefix.."res/bainian_swf_pin"};
		[17] = {["isSwf"] = true;["swfInfoPath"] = RoomChatConfig.s_chatPathPrefix.."res/bianpao_swf_info";["swfPinPath"] = RoomChatConfig.s_chatPathPrefix.."res/bianpao_swf_pin"};

		["expIconSort"] = {
			16,17,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15;
		};
	};

	[2] = {
		["expIconNamePrefix"] = "f"; 		--显示在表情框中的表情按钮的图片名字的前缀
		["expIconResMap"] = vipFace_map2;    --显示在表情框中的表情按钮拼图
		["expAnimNamePrefix"] = "vipExpression";	--播放的表情图片的名字前缀
		["expAnimResMap"] = vip_expressions_map2;	--播放的表情图片拼图
		 [1] = {["imgCount"] = 11;	["playCount"] = 2;	["ms"] = 1000;};
		 [2] = {["imgCount"] = 4;	["playCount"] = 2;	["ms"] = 1000;};
		 [3] = {["imgCount"] = 4;	["playCount"] = 2;	["ms"] = 1000;};
		 [4] = {["imgCount"] = 3;	["playCount"] = 7;	["ms"] = 300;};
		 [5] = {["imgCount"] = 2;	["playCount"] = 7;	["ms"] = 300;};
		 [6] = {["imgCount"] = 4;	["playCount"] = 2;	["ms"] = 1000;};
		 [7] = {["imgCount"] = 11;	["playCount"] = 2;	["ms"] = 900;};
		 [8] = {["imgCount"] = 5;	["playCount"] = 2;	["ms"] = 1000;};
		 [9] = {["imgCount"] = 3;	["playCount"] = 5;	["ms"] = 450;};
		[10] = {["imgCount"] = 3;	["playCount"] = 4;	["ms"] = 600;};
		[11] = {["imgCount"] = 5;	["playCount"] = 1;	["ms"] = 2000;};
		[12] = {["imgCount"] = 4;	["playCount"] = 3;	["ms"] = 600;};
		[13] = {["imgCount"] = 5;	["playCount"] = 4;	["ms"] = 600;};
		[14] = {["imgCount"] = 5;	["playCount"] = 4;	["ms"] = 1000;};
		[15] = {["imgCount"] = 7;	["playCount"] = 4;	["ms"] = 500;};
		[16] = {["imgCount"] = 11;	["playCount"] = 4;	["ms"] = 600;};
		[17] = {["imgCount"] = 5;	["playCount"] = 5;	["ms"] = 450;};
		[18] = {["imgCount"] = 3;	["playCount"] = 4;	["ms"] = 600;};
		[19] = {["imgCount"] = 6;	["playCount"] = 4;	["ms"] = 600;};
		
	};
};