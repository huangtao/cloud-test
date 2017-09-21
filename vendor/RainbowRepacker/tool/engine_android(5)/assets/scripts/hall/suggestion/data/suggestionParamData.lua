require("core/system");
require("core/object");

SuggestionParamData = class();

SuggestionParamData.s_platform = System.getPlatform();

SuggestionParamData.eFeedback = RegionConfigDataInterface.getInstance():getSuggestionParams();

SuggestionParamData.getFeedbackGame = function()
	return SuggestionParamData.eFeedback.game or "";
end

SuggestionParamData.getFeedbackAppid = function()
    if SuggestionParamData.s_platform == kPlatformIOS then
        return SuggestionParamData.eFeedback.ios or "";
    else
        return SuggestionParamData.eFeedback.android or "";
    end
end

