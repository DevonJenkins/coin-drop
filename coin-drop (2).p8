pico-8 cartridge // http://www.pico-8.com
version 43
__lua__
function _init()
	game = {
		state = "menu",
		level = 1,		
	}
	bucket = {
		movement = "false",
		x = 63,
		y = 100,
		fx = false,
		fy = false,
		sprite = 1,
		speed = 3,
		lives = 3,
		score = 0 
			}
	
	coin = {
		x = flr(rnd(2,125)),
		y = 4,
		fx = false,
		fy = false,
		sprite = 2,
		speed = 3,
		-- no lives
		rst = false, --coin reset
		fall = false
	}
end

function _update()
	bucket_movement()
	bucket_edge_detection()
	
	coin_fall()
	
	if coin.y >= 120
	then 
	coin.rst = true			
	bucket.lives -= 1
	end
	
	if 
	coin.x >= bucket.x - 4
	and
	coin.x <= bucket.x + 4
	and
	coin.y >= bucket.y - 4
	and 
	coin.y <= bucket.y +4 
	
	then 
	 coin.rst = true
	 bucket.score += 1
	end
	
	--bucket/coin collision detection
		
end

function _draw()
	cls(5)
	-- when conditiion is met
	if btn(❎) then 
		-- reset sprite
		bucket.movement = true
		game.state = "game"
	 coin.fall = true
	 coin.rst = true	 	 
	end
	if game.state == "game" then
		if coin.rst == false then
		 spr(coin.sprite, coin.x, coin.y)
		else
			coin.y=4
			coin.x=flr(rnd(125))
			coin.rst=false	
		end
	
		print("score: "..bucket.score)
		print("lives: "..bucket.lives)
		spr(bucket.sprite, bucket.x, bucket.y)
		print("state: "..game.state)

		if 
			bucket.lives < 0 
		then 
			gamestate = "gameover"			
		end
	elseif game.state == "menu"
	then	 
	 print("press x to start game",25,63)	
 elseif game.state == "gameover"
 then		
 		cls() 
			print("game over",50,63)
			print("press x to restart")
 end
end
-->8
-- helper functions 
function bucket_movement()
	if bucket.movement == true	
	then
		if 
			btn(⬅️) then bucket.x -= bucket.speed
		elseif 
			btn(➡️) then bucket.x += bucket.speed
		end
	end
end

function bucket_edge_detection()	
	if bucket.x <= 0 then bucket.x = 0
	elseif bucket.x >= 120 then bucket.x = 120
	end
end

function coin_fall()
	if coin.fall == true
	then
	coin.y += coin.speed
	end
end

-->8
--psuedocode

--while moving, make sound
--make sound when i catch a coin
--how to build a one up
		--[[
				- create a heart sprite
				  or use "♥" char
				- every time a coin drops
						pick a random number on 
						a range. the range may 
						change depending on the 
						level. when a specific 
						number in that range is 
						selected, drop a heart sprite.
				- should heart speed increase
						at same rate as coin speed? 
				
		--]]
__gfx__
00000000066666600006600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000006a7799a6006a960000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0070070067a9aa960069960000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000d666666d0067a60000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0007700007d7ddd00067960000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0070070006d7ddd0006a960000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000067d7dd00069960000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000076666600006600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__gff__
0000020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
