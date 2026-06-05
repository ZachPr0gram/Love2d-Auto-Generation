--Tree Generation--
local hotspots = 3 --Algo later--

function index_x(HOTSPOT_MAP, 

function find_hotspot_prox(HOTSPOT_MAP, current_x, current_y) --Essential--
	--1. Find nearest
	--2. Calculate Distance
	--	2a. Back and Front "Feelers"
	--3. Return Distance (or nil)
	if(HOTSPOT_MAP[current_y][current_x]==1)then
		return current_x, current_y
	end

	--back feeler--
	return find_hotspot_prox(HOTSPOT_MAP, current_x-1, current_y)
	--front feeler--
	return find_gotspot_prox(HOTSPOT_MAP, current_x+1, current_y
	return nil
end

function create_hotspots(THE_MAP, length, height)
	local hotspot_radius_constant = 10
	HOTSPOT_MAP = {}
	for i=1, height do
		HOTSPOT_MAP[i] = {}
	end



	
	


end


function is_tree() --Probablity--
	
end

function tree_generation(THE_MAP, length, height)
	TREE_MAP = {}
	for i=1, height do
		TREE_MAP[i]={}
	end


end
