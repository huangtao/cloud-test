--[[view 的公共类]]

function publ_getItemFromTree( node, dir )
	if #dir < 1 or not node then
			return nil;
	end
	for i=1,#dir do
			node = node:getChildByName(dir[i]);
			if not node then
					return nil;
			end
	end
	return node;
end