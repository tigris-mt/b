b.math = {}

local TAU = math.pi * 2

function b.math.angledelta(a, b)
	local a = (a - b) % TAU
	local b = (b - a) % TAU

	return (a < b) and -a or b
end
