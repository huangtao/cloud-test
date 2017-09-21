
require("ui/groupNode");

GroupNode.removeAllChildren = function(self, doCleanup)
    for k, v in pairs(self.m_items) do
        v:setGroup(nil);
    end
    local allChildren = Node.removeAllChildren(self, doCleanup);
    self.m_items = {};
    return allChildren;
end