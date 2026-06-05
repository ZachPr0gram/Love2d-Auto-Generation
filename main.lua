--Main--
require("recursive_generate")
require("rendering")
require("camera")
require("mouse")
require("river_generation")
local aliens = require("aliens.alien_main")
local shaders = require("shader.shader")
local length = 500
local height = 500
local tilesize = 32

function window_setup()
	love.window.setFullscreen(true, "desktop")
	--Nearest Neighbor--
	love.graphics.setDefaultFilter("nearest", "nearest")
end

function print_map(length, height, THE_MAP)
	for i=1, height do
		print()
		for z=1, length do
			io.write(THE_MAP[i][z])
		end
	end
end

function print_neighbors(THE_MAP, x, y, length, height)
	local left, right, up, down = find_neighbors(THE_MAP, x, y, length, height)
	print(up)
	print()
	print(left," ",right)
	print()
	print(down)
end

function load_map_canvas(length, height, tilesize)
	return love.graphics.newCanvas(length*tilesize, height*tilesize)	

end

function love.load()
	--Window Mode--
	window_setup()
	--End--
	
	--Cursor setup--
	mouse_init()
	--End--
	--Map Generation--
	THE_MAP = {}
	map_init(THE_MAP, height+1)
	recur_gen(1,1,length,height+1, THE_MAP) --lua is NOT zero indexed--
	--End--
	--river_generation(THE_MAP, length, height)
	new_river_gen(THE_MAP, length, height)

	--Canvas Things--
	map_canvas = load_map_canvas(length, height, tilesize)
	map_rendering(THE_MAP, map_canvas, length, height)
	--End--

	--Cool Alien Things--
	aliens.alien:load(20, length, height)
	--End--

end

function love.update()
	if(love.keyboard.isDown("escape"))then
		love.event.quit()
	end
	camera_work()

	mouse_update()
	--Checking mouse scale--
	function love.wheelmoved(x,y)
		local mouse_constant = 0.5
		if(y>0)then
			mouse.zoom=mouse.zoom+mouse_constant
		end

		if(y<0)then
			mouse.zoom=mouse.zoom-mouse_constant
		end
	end

	--Cool Alien Things--
	aliens.alien:update()
	--End--
end


function love.draw()
	--Shader--
	love.graphics.setShader(shaders.default)
	--End--
	mouse_scale_draw()
	--Drawing Map Canvas--
	love.graphics.draw(map_canvas, camera.x, camera.y)
	--End--
	
	love.graphics.push()
	love.graphics.translate(camera.x, camera.y)
	aliens.alien:draw()
	love.graphics.pop()
	mouse_draw()
	--End--
	
	
	
	--Cool Alien Things--

	--End--

	--Boiler--
	--love.graphics.pop()
	--End--
end
