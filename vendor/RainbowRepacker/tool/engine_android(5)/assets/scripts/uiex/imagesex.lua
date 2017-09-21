require("ui/images");

Image.setFile = function(self, file)
    if self.m_res then
        self.m_res:setFile(file);
        Image.setResRect(self,0,self.m_res);
        Image.setResTrimAndRotate(self,0,self.m_res);
    end
end

Images.dtor = function(self)
    for _,v in pairs(self.m_reses or {}) do
        delete(v);
    end
    
    self.m_reses = nil;
end
