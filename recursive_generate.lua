--Important Stuff--


--Rules:--
--Grass = Default
--Trees


function tree_generation(THE_MAP, length, height) --At long last--
	--Going to generate a new map on top of THE_MAP
	TREE_MAP = {}
	for i=1, height do
		TREE_MAP[i] = {}	
	end

	--Rules?--
	
end

function is_number(var) --Dont ask me why--
	if(type(var)=="number")then
		return var
	else
		return 0

	end
end

function map_init(THE_MAP, height)
	for i=1, height do
		THE_MAP[i] = {}
	end
end


function check_bound_y(y, height)
	if(y>=1 and y<=height)then
		return 1
	else
		return 0
	end
end

function check_bound_x(x, length)
	if(x>=1 and x<=length)then
		return 1
	else
		return 0
	end
end


function find_neighbors(THE_MAP, current_x, current_y, length, height)
	--left and right--
	if(current_x>1 and check_bound_y(current_y, height))then
		left = THE_MAP[current_y][current_x-1]
	else
		left = nil
	end
	if(current_x<length and check_bound_y(current_y, height))then
		right = THE_MAP[current_y][current_x+1]
	else
		right = nil
	end

	--Up and Down--
	if(current_y>1 and check_bound_x(current_x, length))then
		up = THE_MAP[current_y-1][current_x]
	else
		up = nil
	end

	if(current_y<height and check_bound_x(current_x, length))then
		down = THE_MAP[current_y+1][current_x]
	else
		down = nil
	end
	--Eventually diagonals--

	return left, right, up, down
	
end

--THE FUNCTION--
function find_block(THE_MAP, current_x, current_y, length, height)
	--0 = grass, 1 = dirt--
	if(math.random(1,8)==4)then
		return 1
	end

	--get all dirt surrounding, calculate--

	local up, down, left, right = find_neighbors(THE_MAP, current_x, current_y, length, height)
	local dirt_chance_calculation = (is_number(up)+is_number(down)+is_number(left)+is_number(right))-1
	
	--Actual Work--
	if(math.random(1,8)<3)then
		return 1
	else
		return 0
	end

	--Tree calculations come after--
end

function recur_gen(x,y,length,height, THE_MAP)
		
	
	if(x==1 and y==1)then

		THE_MAP[1][1] = find_block(THE_MAP, x, y, length, height)
		return recur_gen(x+1,y,length,height, THE_MAP)
	end

	--Checking Bounds--
	

	if(y>height)then
		return
	end

	if(x>length)then
		if(y+1>height)then
			return
		else
			THE_MAP[y+1][1] = find_block(THE_MAP, x, y, length, height)
			return recur_gen(2,y+1,length,height, THE_MAP)
		end
	end

	--Actual Work--

	THE_MAP[y][x] = find_block(THE_MAP, x, y, length, height)

	return recur_gen(x+1, y, length, height, THE_MAP)

end


--Does it work?--
