--Alien Main--

possible_states = {"Idle", "Fleeing", ""} --For Reference--
--Behold:--
alien = {}
alien.x=1
alien.y=1
alien.spr = "" --Placeholder--
alien.spookStat = 0 --On init--
alien.state = "Idle"




function alien.spawn()
	self.x = math.random(1, length)
	self.y = math.random(1, height)
end

function alien.dev_tool()
	if(love.keyboard.isDown("x"))then
		self.spookStat=100
	end
end


function alien.stateDetermine()
	--if see, spook = 100
	
	
end
