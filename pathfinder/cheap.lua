b.pathfinder.register("b:cheap", {
	metatable = {
		init = function(self)
			self.at = self.from
			return true
		end,

		next = function(self)
			local delta = vector.subtract(self.to, self.at)
			delta.y = math.sign(delta.y)
			local dir = vector.normalize(delta)
			local next_pos = vector.round(vector.add(self.at, dir))

			-- Jump if necessary to find clearance.
			if not (function()
				for i=0,self:jump_height(self.at) do
					if self:clearance(next_pos) then
						break
					end
					next_pos = vector.add(next_pos, vector.new(0, 1, 0))
				end
				return self:clearance(next_pos)
			end)() then
				-- No clearance, return.
				return
			end

			-- Don't try to fly if impossible.
			if not self:can_walk(next_pos) and (next_pos.y - self.at.y) > 0 then
				return
			end

			self.at = next_pos
			return self.at
		end,

		can_walk = function(self, pos)
			local below = vector.subtract(pos, vector.new(0, 1, 0))
			return self.def.node_walkable(below, minetest.get_node(below))
		end,

		jump_height = function(self, pos)
			local free_space = 0
			for i=0,self.def.jump_height do
				if self:clearance(vector.add(pos, vector.new(0, i, 0))) then
					free_space = i
				end
			end
			return free_space
		end,

		clearance = function(self, pos)
			for i=0,self.def.clearance_height-1 do
				local ipos = (i == 0) and pos or vector.add(pos, vector.new(0, i, 0))
				if not self.def.node_passable(ipos, minetest.get_node(ipos)) then
					return false
				end
			end
			return true
		end,
	},
	expense = 10,
	groups = b.set{
		"cheap",
		"clearance_height",
		"specify_vertical",
		"node_functions_passable",
		"node_functions_walkable",
	},
})
