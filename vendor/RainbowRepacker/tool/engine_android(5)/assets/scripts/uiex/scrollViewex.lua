require("ui/scrollView");

ScrollView.getNodeWidthHeight = function(self)
    return self.m_nodeW, self.m_nodeH
end

ScrollView.setNodeWidthHeight = function(self, w, h)
    if w then
        self.m_nodeW = w
    end
    if h then
        self.m_nodeH = h
    end
end