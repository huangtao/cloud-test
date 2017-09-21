
local ExpressGridView = class(GridView);

ExpressGridView.ctor = function(self, x, y, w, h)
	TableView.setEventDrag(self,nil,nil);
	ExpressGridView.setEventTouch(self,self,self.onEventDrag);
end

return ExpressGridView;