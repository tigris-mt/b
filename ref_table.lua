-- Convert object reference to serializable table.
-- Extend in mods implementing mobs/etc.
-- Returns nil if unable to convert.
function b.ref_to_table(obj)
	if obj:is_player() then
		return {type = "player", id = obj:get_player_name()}
	end
end

b.ref_table_equal = b.t.equal
