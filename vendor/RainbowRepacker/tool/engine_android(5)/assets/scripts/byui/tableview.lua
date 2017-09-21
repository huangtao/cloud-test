local Scroll = require('byui/scroll');
local class, mixin, super = unpack(require('byui/class'))
local M = {}

M.TableView = class('TableView', Scroll.ScrollView, {
    __init__ = function(self, args)
    	args.dimension = args.dimension == kHorizental and kHorizental or kVertical 
    	super(M.TableView, self).__init__(self, args);
    	self.pos_dimension = args.dimension == kVertical and 'y' or 'x'
    	self.container = Widget()
        self.container.relative = true
        self.content = self.container

    	self._item_length = args.item_length;
    	self._item = args.item;
    	self._item_count = args.item_count;

    	self.create_top_view = args.create_top_view
        self.create_bottom_view = args.create_bottom_view

    	self.min_load_ahead_multiple = args.min_load_ahead_multiple or 1; -- Multiple of content length
    	self.free_back_multiple = args.free_back_multiple or 0;

    	self._cell_spacing = args.cell_spacing or 1;

    	self.size = args.size

    	self._cache = {	cells={},
    					pos={0}, -- the first always be 0 
    					range={1,1}, --[1,1)
						max_count = self:_item_count(),
    					};

    	local length = self:_init_cell_pos();

    	self.container.size = Point(self.width,length);
    	
    	self:on_scroll(Point(0,0),Point(-1,-1),Point(0,0));
    end,

    --return length
    _init_cell_pos = function(self)
    	local cache_pos = self._cache.pos;

    	local cur_cache_count = #cache_pos;
    	local max_count = self._cache.max_count;
    	
		for i=cur_cache_count+1,max_count do 
			cache_pos[i] = cache_pos[i-1] + self:_item_length(i-1) + self._cell_spacing;
		end

		cache_pos[max_count+1] = cache_pos[max_count] + self:_item_length(max_count);
		return cache_pos[max_count+1];
	end,

	_load_one = function(self,i)
		assert(self._cache.cells[i] == nil,"invaild load " .. i);
    	local cell = self:_item(i);
    	self.container:add(cell);
		cell.width = self.width;
		cell.y = self._cache.pos[i];
		self._cache.cells[i] = cell;
    	return cell;
	end,

	_free_one = function(self,i)
		local cell = self._cache.cells[i];
		assert(cell,"invaild free" .. i);
		cell:remove_from_parent();
		self._cache.cells[i] = nil;
	end,

	_load = function(self, from, to)
		local range = self._cache.range;

		local cache_beg = self._cache.pos[range[1]];
		local cache_end = self._cache.pos[range[2]];

		local max_count = self._cache.max_count;

		while range[1] > 1 and from < cache_beg  do -- include range[0]
			print("load");
			range[1] = range[1] - 1;
			local cell = self:_load_one(range[1]);
			-- self.container:add(cell);
			cache_beg = self._cache.pos[range[1]];
		end

		while to > cache_end and range[2] <= max_count do -- exclude range[1]
			print("load");
			local cell = self:_load_one(range[2]);
			range[2] = range[2] + 1;
			cache_end = self._cache.pos[range[2]];
		end
	end,

	_free = function(self, free_to, direction)
		local range = self._cache.range;

		local cache_end = self._cache.pos[range[2]];

		local max_count = self._cache.max_count;

		if direction < 0 then -- from cache_beg to free_to
			local cache_beg_bottom = self._cache.pos[range[1] + 1];

			while range[1] <= max_count and free_to > cache_beg_bottom  do --
				print("free");
				self:_free_one(range[1]);
				range[1] = range[1] + 1;
				cache_beg_bottom = self._cache.pos[range[1] + 1];
			end
		else --from free_to to cache_end
			local cache_end_top = self._cache.pos[range[2]-1];

			while free_to < cache_end_top and range[2] > 1 do
				print("free");
				range[2] = range[2] - 1;
				self:_free_one(range[2]);
				cache_end_top = self._cache.pos[range[2]-1];
			end
		end
	end,

	_dump = function(self)
		print("dump: ")
		for i=1,self._cache.max_count do
			print("" .. i .. " " .. tostring(self._cache.cells[i]));
		end
	end,

	-- _move_item_before = function(self,from_index, to_index, diff_index, diff_length)

	-- 	for i = from_index, to_index, 1 do
	-- 		self._cache.pos[i+diff_index] = self._cache.pos[i] + diff_length;
	-- 		if self._cache.cells[i] ~= nil then
	-- 			self._cache.cells[i+diff_index] =  self._cache.cells[i];
	-- 			self._cache.cells[i+diff_index].y = self._cache.pos[i+diff_index];
	-- 			self._cache.cells[i] = nil;
	-- 		end
	-- 	end

	-- 	return from_index + diff_index;
	-- end,

	_move_item = function(self,from_index, to_index, diff_index, diff_length)
		print("move " .. from_index .. " " .. to_index .. " "..  diff_index);
		local init_value;
		local end_value;
		local acc;
		if diff_index > 0 then
			init_value = to_index;
			end_value = from_index;
			acc = -1;
		else
			init_value = from_index;
			end_value = to_index;
			acc = 1;
		end

		for i = init_value, end_value, acc do
			print("move" .. i);
			self._cache.pos[i+diff_index] = self._cache.pos[i] + diff_length;
			if self._cache.cells[i] ~= nil then
				self._cache.cells[i+diff_index] =  self._cache.cells[i];
				self._cache.cells[i+diff_index].y = self._cache.pos[i+diff_index];
				self._cache.cells[i] = nil;
			end
		end

		return from_index + diff_index;
	end,

	insert = function(self, indices)
		assert(type(indices)=="table")
		table.sort(indices, function(a,b) return a<b end);
		local count = #indices;

		local length_acc = {0};
		for i=2,count+1 do 
			length_acc[i] = length_acc[i-1] + self:_item_length(i) + self._cell_spacing;
		end

		self:_dump();

		indices[count + 1] = self._cache.max_count+1;
		for i = count, 1, -1 do 
			local index = indices[i];
			local next_index = self:_move_item(indices[i],indices[i+1],i,length_acc[i+1]);
			local real_index = index + i - 1;

			self._cache.pos[real_index] = self._cache.pos[next_index] - (length_acc[i+1] - length_acc[i]);

			if index >= self._cache.range[1] and index < self._cache.range[2] then
				self:_load_one(real_index);
				self._cache.range[2] = self._cache.range[2] + 1;
			end
		end

		self._cache.max_count = self._cache.max_count + count;
	end,

	remove = function(self, indices)
		assert(type(indices)=="table")

		table.sort(indices, function(a,b) return a<b end);
		local count = #indices;

		local length_acc = {0};
		for i=2,count+1 do 
			length_acc[i] = length_acc[i-1] + self:_item_length(i) + self._cell_spacing;
		end

		indices[count + 1] = self._cache.max_count + 1;

		for i = 1, count do 
			local index = indices[i];

			if self._cache.cells[index] then
				self:_free_one(index);
			end

			if index+1 < indices[i+1]-1 then
				self:_move_item(index+1,indices[i+1]-1,-i,-length_acc[i+1])

				if index >= self._cache.range[1] and index < self._cache.range[2] then
					for j=1,i do
						self:_load_one(self._cache.range[2]-j);
					end
				end
			end
		end

		self._cache.max_count = self._cache.max_count - count;
	end,

	reload_cell = function(self, indices)
		if not indices then
			local  range = self._cache.range;
			for i=range[1],range[2] do
				if self._cache.cells[v] then
					self:_free_one(v);
					self:_load_one(v);
				end
			end
		else 
			for k,v in ipairs(indices) do 
				if self._cache.cells[v] then
					self:_free_one(v);
					self:_load_one(v);
				end
			end
		end
	end,
	
	on_scroll = function(self, value, direction, velocity)
        local dim_value = self.dimension == kVertical and self.height or self.width
		local load_ahead = math.max(math.abs(math.ceil(velocity[self.pos_dimension] * 0.2)), self.min_load_ahead_multiple*dim_value);
		local free_back = self.free_back_multiple * dim_value;

		if direction[self.pos_dimension] < 0 then 
        	self:_load(-value[self.pos_dimension] + dim_value, -value[self.pos_dimension] + dim_value + load_ahead);
        	self:_free(-value[self.pos_dimension]-free_back,direction[self.pos_dimension])
        else 
        	self:_load(-value[self.pos_dimension], -value[self.pos_dimension] + load_ahead);
        	self:_free(-value[self.pos_dimension]+dim_value+free_back,direction[self.pos_dimension]);
        end
    end,

    on_overscroll = function(self, overscroll)
        if overscroll[self.pos_dimension] == 0 then
            if self.top_view then
                self.top_view.visible = false
            end
            if self.bottom_view then
                self.bottom_view.visible = false
            end
        elseif overscroll[self.pos_dimension] > 0 then
            if self.create_top_view ~= nil and self.top_view == nil then
                self.top_view = self:create_top_view()
                self.top_view.x = self.width / 2
                self.top_view.zorder = -1
                self:add(self.top_view)
            end
            if self.top_view ~= nil then
                self.top_view.visible = true

                if self.top_view.on_overscroll  then
                	self.top_view:on_overscroll(overscroll[self.pos_dimension]);
                end

                if overscroll[self.pos_dimension] > self.top_view.height then
                    -- start refreshing
                    if not self._refreshing then
                    	print("refresh")
                        self.kinetic[self.pos_dimension].max = self.top_view.height
                        self:on_touch_cancel()
                        self._refreshing = true
                        if self.on_refresh then
                            self:on_refresh()
                        end
                    end
                end
            end
        else
            if self.top_view then
                self.top_view.visible = false
            end
            overscroll[self.pos_dimension] = math.abs(overscroll[self.pos_dimension])
            if self.create_bottom_view ~= nil and self.bottom_view == nil then
                self.bottom_view = self:create_bottom_view()
                self.bottom_view[self.pos_dimension] = self.height - 20
                self.bottom_view[self.pos_dimension == 'y' and 'x' or 'y'] = self.width / 2
                self.bottom_view.zorder = -1
                self:add(self.bottom_view)
            end
            if self.bottom_view ~= nil then
                self.bottom_view.visible = true;

                if self.bottom_view.on_overscroll  then
                	self.bottom_view:on_overscroll(overscroll[self.pos_dimension]);
                end

                if overscroll[self.pos_dimension] > self.bottom_view.height then
                    -- start refreshing
                    if not self._refreshing then
                    	print("refresh")
                        self.kinetic[self.pos_dimension].min = self.height - self.container.height - self.bottom_view.height;
                        self:on_touch_cancel()
                        self._refreshing = true
                        if self.on_refresh then
                            self:on_refresh()
                        end
                    end
                end
            end
        end
    end,
    cancel_refresh = function(self)
        -- stop refreshing
        self.kinetic[self.pos_dimension].max = 0
        self.kinetic[self.pos_dimension].min = self.height - self.container.height;
        self:on_touch_cancel()
        self._refreshing = false
    end,


 },true);

return M;
