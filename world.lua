-- The world size.
b.WORLD = {
	min = vector.new(-30912, -30912, -30912),
	max = vector.new(30926, 30926, 30926),
}

b.WORLD.box = b.box.new(b.WORLD.min, b.WORLD.max)

-- The world size, aligned to chunks.
b.WORLDA = {
	min = vector.new(-30000, -30000, -30000),
	max = vector.new(30000, 30000, 30000),
}

b.WORLDA.box = b.box.new(b.WORLDA.min, b.WORLDA.max)
