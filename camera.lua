--Camera--

camera = {}
camera.x=0
camera.y=0


function camera_work()
	--Might eventually import a library for this!--
	if(love.keyboard.isDown("lshift"))then
		constant=12
	else
		constant=8
	end
	if(love.keyboard.isDown("d"))then
		camera.x= camera.x-constant	
	end

	if(love.keyboard.isDown("a"))then
		camera.x= camera.x+constant
	end

	if(love.keyboard.isDown("w"))then
		camera.y=camera.y+constant
	end

	if(love.keyboard.isDown("s"))then
		camera.y=camera.y-constant
	end


end
