require("gameBase/socketReader");
require("common/commonSocketReader");
require("hall/login/socket/loginSocketCmd");

LoginSocketReader = class(CommonSocketReader);


LoginSocketReader.s_severCmdFunMap = {
};
