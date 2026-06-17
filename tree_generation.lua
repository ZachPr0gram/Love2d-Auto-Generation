--Tree Generation--
local hotspots = 3 --Algo later--


function find_hotspot_prox(HOTSPOT_MAP, current_x, current_y) --Essential-- --Will return distance (int)--
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

function create_hotspots(length, height)
	local hotspot_radius_constant = 10
	
	HOTSPOT_MAP = {}
	for i=1, height do
		HOTSPOT_MAP[i] = {}
	end

	--Filling with zeroes--


	for i=1, heigth do
		for j=1, length do
			if(math.random(5)==2)then
				--Check nearby prox, place--
				if(find_hotspot_prox<=hotspot_radius_constant)then
					HOTSPOT_MAP[i][j] = 1 --Hotspot--
				else
					HOTSPOT_MAP[i][j] = 0 --Base--
				end
				
			else
				HOTSPOT_MAP[i][j] = 0 --Base--
			end
		end
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
