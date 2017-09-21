require("ui/images");

--恢复图片本身大小
Image.restoreSize = function(self)
	local __width = self.m_res:getWidth();
	local __height = self.m_res:getHeight();

	Image.setSize(self,__width,__height);
end