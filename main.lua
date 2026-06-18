--Main--
require("recursive_generate")
require("rendering")
require("camera")
require("river_generation")
Trees = require("tree_generation")
local shaders = require("shader.shader")



local length = 100
local height = 100
local tilesize = 32
mouse = {}
mouse.zoom = 1

function mouse:zoom_debug()
	--Purely for testing purposes--
	local width
	local height
	width, height = love.graphics.getDimensions()
	love.graphics.print(self.zoom, 20, height-10)

end

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
	

	--Map Generation--
	THE_MAP = {}
	map_init(THE_MAP, height+1)
	recur_gen(1,1,length,height+1, THE_MAP) --lua is NOT zero indexed--
	--End--
	--river_generation(THE_MAP, length, height)
	new_river_gen(THE_MAP, length, height)
	Trees:rendering_trees(THE_MAP, length, height)

	--Canvas Things--
	map_canvas = load_map_canvas(length, height, tilesize)
	map_rendering(THE_MAP, map_canvas, length, height)
	--End--


end

function love.update()
	if(love.keyboard.isDown("escape"))then
		love.event.quit()
	end
	camera_work()

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

	
end


function love.draw()
	mouse:zoom_debug()
	--Shader--
	love.graphics.setShader(shaders.default)
	--End--
	love.graphics.scale(mouse.zoom, mouse.zoom)
	--Drawing Map Canvas--
	love.graphics.draw(map_canvas, camera.x, camera.y)
	--End--
	
	love.graphics.push()
	love.graphics.translate(camera.x, camera.y)
	love.graphics.pop()
	--End--
	
end
