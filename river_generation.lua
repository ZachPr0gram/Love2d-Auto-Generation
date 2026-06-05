--River Generation--

function generate_path()

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
