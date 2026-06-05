--Mouse--
require("camera")
mouse = {}
mouse.image = love.graphics.newImage("/assets/Choice.png")
mouse.x = 0
mouse.y = 0
mouse.tileX = 0
mouse.tileY = 0
mouse.zoom = 1

function mouse_init()
	love.mouse.setVisible(false)
end
function mouse_update()
	local constant = 32
	local x, y = love.mouse.getPosition()

	-- Convert screen coordinates into world coordinates.
	-- The world is drawn with the camera offset, so the mouse needs the opposite offset.
	x = x
	y = y

	-- Keep the cursor sprite in pixel space so it follows the real mouse smoothly.
	mouse.x = x
	mouse.y = y

	-- Tile coordinates can still be useful for selection or highlighting.
	mouse.tileX = math.floor(x / constant) + 1
	mouse.tileY = math.floor(y / constant) + 1

	
end


function mouse_draw()
	love.graphics.draw(mouse.image, mouse.x, mouse.y)
end


function mouse_scale_draw()
	love.graphics.scale(mouse.zoom)
end





