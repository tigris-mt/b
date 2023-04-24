b.math = {}

local TAU = math.pi * 2

function b.math.angledelta(a, b)
	local na = (a - b) % TAU
	local nb = (b - a) % TAU

	return (na < nb) and -na or nb
end
