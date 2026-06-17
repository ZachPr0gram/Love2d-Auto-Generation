--Shaders--
local shaders={}

shaders.default = love.graphics.newShader([[
	vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords){
		vec4 pixel = Texel(texture, texture_coords);
		return pixel*vec4(0.75, 0.70, 0.90, 1.0);

	}
]])



return shaders
