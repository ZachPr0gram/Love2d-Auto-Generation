--Alien Main--

possible_states = {"Idle", "Spooked", "Fleeing", ""} --For Reference--
all_aliens = {}
--Behold:--
alien = {}
alien.x=1
alien.y=1
alien.speed=4
alien.spr = love.graphics.newImage("assets/Alien.png") --Placeholder--
alien.spookStat = 0 --On init--
alien.state = "Idle"


function run()

end

function spawn(all_aliens, current, length, height)
	all_aliens[current] = {
		x = math.random(1, length)*32,
		y = math.random(1, height)*32,
		spr = alien.spr,
		spookStat = alien.spookStat,
		state = alien.state
	}
end

function alien:dev_tool()
	if(love.keyboard.isDown("x"))then
		self.spookStat=100
	end
end


function alien:stateDetermine()
	--if see, spook = 100--

	if(math.random(1,100)<self.spookStat)then
		self.state = "Spooked"
	else
		self.state = "Idle"
	end
	
end

function alien:load(value, length, height)
	for i=1, value do
		spawn(all_aliens, i, length, height)
	end
end


function alien:update()
	self:dev_tool()
	self:stateDetermine()


	if(self.state=="Spooked")then
		alien.speed = 8
		run()
	else

	end
	
	

end



function alien:draw()
	for i=1, #all_aliens do
		if all_aliens[i].spr ~= nil and all_aliens[i].spr ~= "" then
			love.graphics.draw(all_aliens[i].spr, all_aliens[i].x, all_aliens[i].y)
		end
	end
end

return {
	alien = alien,
	all_aliens = all_aliens
}
