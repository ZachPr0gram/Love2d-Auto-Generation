--River Generation--

function to_middle(THE_MAP, river_points,x,y, iter)
	local start = river_points[iter][1]
	local end = river_points[iter][3]
	--Function implementation--
	local randomness = function() return not(math.random(1,12)>4) end
	--End--
	local diff_x = start[1] - end[1]
	local diff_y = start[2] - end[2]

	if(diff_x == math.abs(diff_x_))then
		--Head to left--

	end
	THE_MAP[y][x]=3
	return to_middle(THE_MAP, river_points,x,y)

end

function to_end(THE_MAP, river_points)

end



function generate_path(THE_MAP, river_points)
	current_mode = "start"
	current_x = nil

end

function river_generation(THE_MAP, length, height)
	--pair: start and end points--
	height = height-1
	local Axis = {"Top", "Bottom", "Left", "Right"}
	local number_of_pairs = 2
	for i=0, number_of_pairs do
		--Random start point+axis--
		local starter_axis = Axis[math.random(#Axis)]
		if(starter_axis=="Top")then
			x = math.random(1, length)
			y=1
		elseif(starter_axis=="Bottom")then
			x=math.random(1, length)
			y=height
		elseif(starter_axis=="Left")then
			x=1
			y=math.random(1,height)
		elseif(starter_axis=="Right")then
			x=length
			y=math.random(1,height)
		end

		end_x = math.random(1, length)
		end_y = math.random(1,height)

		--Actually altering the map now--
		THE_MAP[y][x]=3


		
	end
end


function random_axis_point(length, height)
	x=1
	y=1
	choices = {"TOP", "BOTTOM", "LEFT", "RIGHT"}
	local choice = choices[math.random(#choices)]
	if(choice=="TOP")then
		x=math.random(1, length)
		y=1	
	end

	if(choice=="BOTTOM")then
		x=math.random(1,length)
		y=height
	end

	if(choice=="LEFT")then
		x=1
		y=math.random(1,height)
	end

	if(choice=="RIGHT")then
		x=length
		y=math.random(1,height)
	end

	return x,y
end


function new_river_gen(THE_MAP, length, height) --Gives river_points, THE_MAP functions take care of the rest--
	river_points = {}
	local rivers=2
	for i=1, rivers do
		local start_x,start_y = random_axis_point(length, height)
		local end_x, end_y = random_axis_point(length, height)
		river_points[i] = {{start_x, start_y},{math.random(length), math.random(height)},{end_x, end_y}}
	
	end
	

	--Rendering here I guess?--
	for i=1, rivers do
		THE_MAP[river_points[i][1][2]][river_points[i][1][1]] = 3 --Start--
		THE_MAP[river_points[i][2][2]][river_points[i][2][1]] = 3 --Middle--
		THE_MAP[river_points[i][3][2]][river_points[i][3][1]] = 3 --End--
	end
	
end
