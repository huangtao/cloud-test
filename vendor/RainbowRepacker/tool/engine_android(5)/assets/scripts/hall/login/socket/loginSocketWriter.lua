require("gameBase/socketWriter");
require("hall/login/socket/loginSocketCmd");
require("util/log");

LoginSocketWriter = class(SocketWriter);

LoginSocketWriter.onSendSwitchAccount = function(self, packetId)
end

LoginSocketWriter.s_clientCmdFunMap = {
	[LOGIN_SWITCH_ACCOUNT]			= LoginSocketWriter.onSendSwitchAccount;
};
