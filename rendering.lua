--Map Rendering--


local Dirt = love.graphics.newImage("/assets/Dirt.png")
local Grass = love.graphics.newImage("/assets/Grass.png")
local Tree = love.graphics.newImage("/assets/Tree.png")
local Water = love.graphics.newImage("/assets/Water.png")

function map_rendering(THE_MAP, map_canvas, length, height)
	love.graphics.setCanvas(map_canvas)
	love.graphics.clear()
	local constant = 32 --32x32 pixel--
	for i=1, height do
		for z=1, length do
			if(THE_MAP[i][z]==1)then	
				love.graphics.draw(Grass, z*constant, i*constant)
			elseif(THE_MAP[i][z]==0)then
				love.graphics.draw(Dirt, z*constant, i*constant)
			elseif(THE_MAP[i][z]==3)then
				love.graphics.draw(Water, z*constant, i*constant)
			end
		end
	end
	love.graphics.setCanvas()
end
