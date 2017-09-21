local hallLayerBaseWithName = require("hall/widget/hallLayerBaseWithName")
local AnimSend = class(hallLayerBaseWithName,false);
AnimSend.s_layerName = "redenvelope_anim_send";

AnimSend.ctor = function(self,p_data)   
    --补全数据
    p_data = p_data or {};
    p_data.pos = p_data.pos or {x=0,y=0};
    p_data.speed = p_data.speed or 100;
    p_data.callFunc = p_data.callFunc or function() end;

    RedEnvelopDataInterface.getInstance():setObserver(self);

    local __configTab = require(ViewPath.."hall/redEnvelope/anim_send");
    super(self,__configTab,nil,AnimSend.s_layerName);
    self:declareLayoutVar(ViewPath.."hall/redEnvelope/anim_send".."_layout_var");

    self:getBgBlur(10);
    self.m_data = p_data or {};
    self:setFillParent(true, true);

    self:getHandle();

    self:init();

    self.m_popRecordFunc = function() end;
end

AnimSend.dtor = function(self)  
    RedEnvelopDataInterface.getInstance():clearObserver(self);
end

--得到相关句柄
AnimSend.getHandle = function(self)
    --编辑器里控件的句柄
    self:getComponent();
end 

AnimSend.init = function(self)

    self.mm_Image_envelope:setPos(self.m_data.pos.x,self.m_data.pos.y);
    self.m_target_posX,self.m_target_posY = self.mm_View_for_targetPos:getAbsolutePos();
    local __length = math.sqrt(((self.m_target_posX - self.m_data.pos.x)*(self.m_target_posX - self.m_data.pos.x)) + ((self.m_target_posY - self.m_data.pos.y)*(self.m_target_posY - self.m_data.pos.y)));
    self.m_time = __length/self.m_data.speed;

    local whiteScale = require("libEffect/shaders/whiteScale");
    whiteScale.applyToDrawing(self.mm_Image_envelope,{bright = 0.99});

    local objectMoveAnim = self.mm_Image_envelope:addPropTranslate(1, kAnimNormal, self.m_time, -1, 0, self.m_target_posX - self.m_data.pos.x, 0, self.m_target_posY - self.m_data.pos.y);
    objectMoveAnim:setEvent(self.mm_Image_envelope, function()
            self:removeProp(1);
            self.mm_Image_envelope:setPos(endX,endY);
            self.mm_Swf_send:play(1,false,1,0,false);
            self.mm_Image_envelope:setVisible(false);
            self.mm_Swf_send:setCompleteEvent(self, self.__close);
        end
        );
end

AnimSend.onSendRedEnvelop = function(self, isSuccess, data, sendParam)
    if isSuccess then
        self.m_popRecordFunc = function()
            local __call = function()
                LayerManagerIsolater.getInstance():show("redenvelope_record");
            end
            LayerManagerIsolater.getInstance():show("redenvelope_detail",{
                    id = tonumber(data.luckyId) or 0,
                    func_back = __call ,
                    isNeedShowAllTakeMoneyNum = true,
                    isJustSendRedEnvelop = true,
                    takenum = 0,
                    num = tonumber(data.num) or 0,
                    takemoney = 0,
                    totalmoney = tonumber(data.money) or 0,
                    type = tonumber(data.type) or 0
                });
        end
    end
end

--------------------------------private----------------------------

AnimSend.__close = function(self)
    self:close();
    self.m_popRecordFunc();
end

return AnimSend;