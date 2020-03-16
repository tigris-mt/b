b = {}

-- Do a file relative to the current mod.
b.dofile = function(path)
	return dofile(minetest.get_modpath(minetest.get_current_modname()) .. "/" .. path)
end

b.dofile("table.lua")
b.dofile("set.lua")
