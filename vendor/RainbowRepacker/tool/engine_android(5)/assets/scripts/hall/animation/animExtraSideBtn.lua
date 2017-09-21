AnimExtraSideBtn = {}

AnimExtraSideBtn.onSideBtnHideAnimOver = function()
	AnimExtraSideBtn.m_sideBtn:setVisible(false);
	AnimExtraSideBtn.sideBtnDelete();
    if AnimExtraSideBtn.m_obj and AnimExtraSideBtn.m_callbackFunc then
        AnimExtraSideBtn.m_callbackFunc(AnimExtraSideBtn.m_obj);
    end
end

AnimExtraSideBtn.onSideBtnShowAnimOver = function()
	AnimExtraSideBtn.m_sideBtn:setVisible(true);
	AnimExtraSideBtn.sideBtnDelete();
end

AnimExtraSideBtn.sideBtnDelete = function ()
     if AnimExtraSideBtn.m_sideBtn then
		AnimExtraSideBtn.m_sideBtn:removeProp(1);
		AnimExtraSideBtn.m_sideBtn:removeProp(2);
		AnimExtraSideBtn.m_sideBtn:removeProp(3);
		AnimExtraSideBtn.m_sideBtn:removeProp(4);
	end
	delete(AnimExtraSideBtn.m_sideBarOpenFirstAnim);
	delete(AnimExtraSideBtn.m_sideBarOpenSecondAnim);
	delete(AnimExtraSideBtn.m_sideBarCloseFirstAnim);
	delete(AnimExtraSideBtn.m_sideBarCloseSecondAnim);
	AnimExtraSideBtn.m_sideBarOpenFirstAnim = nil;
	AnimExtraSideBtn.m_sideBarOpenSecondAnim = nil;
	AnimExtraSideBtn.m_sideBarCloseFirstAnim = nil;
	AnimExtraSideBtn.m_sideBarCloseSecondAnim = nil;
end

AnimExtraSideBtn.startSideBtnAnim = function(sideBtn,visible,obj,callbackFunc)
    if not sideBtn then
        return;
    end
    AnimExtraSideBtn.m_sideBtn = sideBtn;
    AnimExtraSideBtn.m_obj = obj;
    AnimExtraSideBtn.m_callbackFunc = callbackFunc;
    AnimExtraSideBtn.sideBtnDelete();
	if AnimExtraSideBtn.m_sideBtn then
		local w,_ = AnimExtraSideBtn.m_sideBtn:getSize();
		AnimExtraSideBtn.m_sideBtn:setVisible(true);
		if visible then
			AnimExtraSideBtn.m_sideBarCloseFirstAnim = AnimExtraSideBtn.m_sideBtn:addPropTranslate(1,kAnimNormal,250,-1,w,-20,0,0);
			AnimExtraSideBtn.m_sideBarCloseFirstAnim:setDebugName("PropTranslate.sideBarOpenSecondAnim");
			AnimExtraSideBtn.m_sideBarCloseSecondAnim = AnimExtraSideBtn.m_sideBtn:addPropTranslate(2,kAnimNormal,100,250,0,20,0,0);
			AnimExtraSideBtn.m_sideBarCloseSecondAnim:setDebugName("PropTranslate.sideBarOpenFirstAnim");
			AnimExtraSideBtn.m_sideBarCloseSecondAnim:setEvent(AnimExtraSideBtn, AnimExtraSideBtn.onSideBtnShowAnimOver);
		else
			AnimExtraSideBtn.m_sideBarOpenFirstAnim = AnimExtraSideBtn.m_sideBtn:addPropTranslate(3,kAnimNormal,100,-1,0,-20,0,0);
			AnimExtraSideBtn.m_sideBarOpenFirstAnim:setDebugName("PropTranslate.sideBarOpenFirstAnim");
			AnimExtraSideBtn.m_sideBarOpenSecondAnim = AnimExtraSideBtn.m_sideBtn:addPropTranslate(4,kAnimNormal,250,100,0,w,0,0);
			AnimExtraSideBtn.m_sideBarOpenSecondAnim:setDebugName("PropTranslate.sideBarOpenSecondAnim");
			AnimExtraSideBtn.m_sideBarOpenSecondAnim:setEvent(AnimExtraSideBtn, AnimExtraSideBtn.onSideBtnHideAnimOver);
		end
	end
end
