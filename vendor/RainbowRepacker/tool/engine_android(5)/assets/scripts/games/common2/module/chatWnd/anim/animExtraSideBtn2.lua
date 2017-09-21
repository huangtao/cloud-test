AnimExtraSideBtn2 = {}

AnimExtraSideBtn2.onSideBtnHideAnimOver = function()
	AnimExtraSideBtn2.m_sideBtn:setVisible(false);
	AnimExtraSideBtn2.sideBtnDelete();
    if AnimExtraSideBtn2.m_obj and AnimExtraSideBtn2.m_callbackFunc then
        AnimExtraSideBtn2.m_callbackFunc(AnimExtraSideBtn2.m_obj);
    end
end

AnimExtraSideBtn2.onSideBtnShowAnimOver = function()
	AnimExtraSideBtn2.m_sideBtn:setVisible(true);
	AnimExtraSideBtn2.sideBtnDelete();
end

AnimExtraSideBtn2.sideBtnDelete = function ()
	AnimExtraSideBtn2._removeProp(AnimExtraSideBtn2.m_sideBtn,1);
	AnimExtraSideBtn2._removeProp(AnimExtraSideBtn2.m_sideBtn,2);
	AnimExtraSideBtn2._removeProp(AnimExtraSideBtn2.m_sideBtn,3);
	AnimExtraSideBtn2._removeProp(AnimExtraSideBtn2.m_sideBtn,4);

	AnimExtraSideBtn2.m_sideBarOpenFirstAnim = nil;
	AnimExtraSideBtn2.m_sideBarOpenSecondAnim = nil;
	AnimExtraSideBtn2.m_sideBarCloseFirstAnim = nil;
	AnimExtraSideBtn2.m_sideBarCloseSecondAnim = nil;
end

AnimExtraSideBtn2.startSideBtnAnim = function(sideBtn,visible,obj,callbackFunc)
    if not sideBtn then
        return;
    end
    AnimExtraSideBtn2.m_sideBtn = sideBtn;
    AnimExtraSideBtn2.m_obj = obj;
    AnimExtraSideBtn2.m_callbackFunc = callbackFunc;
    AnimExtraSideBtn2.sideBtnDelete();
	if AnimExtraSideBtn2.m_sideBtn then
		local w,_ = AnimExtraSideBtn2.m_sideBtn:getSize();
		AnimExtraSideBtn2.m_sideBtn:setVisible(true);
		if visible then
			AnimExtraSideBtn2._removeProp(AnimExtraSideBtn2.m_sideBtn,1);
			AnimExtraSideBtn2._removeProp(AnimExtraSideBtn2.m_sideBtn,2);

			AnimExtraSideBtn2.m_sideBarCloseFirstAnim = AnimExtraSideBtn2.m_sideBtn:addPropTranslate(1,kAnimNormal,250,-1,w,-20,0,0);
			AnimExtraSideBtn2.m_sideBarCloseFirstAnim:setDebugName("PropTranslate.sideBarCloseFirstAnim");
			AnimExtraSideBtn2.m_sideBarCloseSecondAnim = AnimExtraSideBtn2.m_sideBtn:addPropTranslate(2,kAnimNormal,100,250,0,20,0,0);
			AnimExtraSideBtn2.m_sideBarCloseSecondAnim:setDebugName("PropTranslate.sideBarCloseSecondAnim");
			AnimExtraSideBtn2.m_sideBarCloseSecondAnim:setEvent(AnimExtraSideBtn2, AnimExtraSideBtn2.onSideBtnShowAnimOver);
		else
			AnimExtraSideBtn2._removeProp(AnimExtraSideBtn2.m_sideBtn,3);
			AnimExtraSideBtn2._removeProp(AnimExtraSideBtn2.m_sideBtn,4);
			AnimExtraSideBtn2.m_sideBarOpenFirstAnim = AnimExtraSideBtn2.m_sideBtn:addPropTranslate(3,kAnimNormal,100,-1,0,-20,0,0);
			AnimExtraSideBtn2.m_sideBarOpenFirstAnim:setDebugName("PropTranslate.sideBarOpenFirstAnim");
			AnimExtraSideBtn2.m_sideBarOpenSecondAnim = AnimExtraSideBtn2.m_sideBtn:addPropTranslate(4,kAnimNormal,250,100,0,w,0,0);
			AnimExtraSideBtn2.m_sideBarOpenSecondAnim:setDebugName("PropTranslate.sideBarOpenSecondAnim");
			AnimExtraSideBtn2.m_sideBarOpenSecondAnim:setEvent(AnimExtraSideBtn2, AnimExtraSideBtn2.onSideBtnHideAnimOver);
		end
	end
end

AnimExtraSideBtn2._removeProp = function(drawing,sequence)
	if drawing and typeof(drawing,DrawingBase) and (not drawing:checkAddProp(sequence)) then 
		drawing:removeProp(sequence);
	end
end
