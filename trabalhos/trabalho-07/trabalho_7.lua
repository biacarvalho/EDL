function love.load()
  playerx = 200
  playery = 200
  gameover= 0 
  t=0
  rotina = 0
  direcao = 'left'
  rotina = {x = 50,y = 100}
  star = {sx = 29,sy = 200}
  player = love.graphics.newImage("player.png")
  img = love.graphics.newImage("enemy.png")
  rotina = love.graphics.newImage("background.png")
  pontos = 0
  --Trabalho 07: Closure
  tempo = Tempo(0, 0)
  
  
end
local cont = {}

-- Trabalho 07: Closure --- o conceito de closure consiste em o que é o ambiente(closure) e como ele funciona.Toda vez que eu chamar a closure ela vai modificar 
--- o valor da mãe dela. Os upvalues são os parametros que a função mãe recebe e são usados na função filha, que é retornada. 
function Tempo(m, s)
  return {
    add = function (dt)
      s = s + dt
      if s >= 60 then
        s = s - 60
        m = m + 1
      end
      return m, math.floor(s)
    end
  }
end
 
function love.draw()
  love.graphics.setBackgroundColor(0, 0 ,255)
  for i,v in ipairs(cont) do
    love.graphics.setColor(0,0,0)
    love.graphics.rectangle("fill",v.bx,v.by,4,4)
        v.bx = v.bx+4
  end
  love.graphics.setColor(0,255,255)
  
  
  
  love.graphics.print("Pontuação: "..pontos,30,70)
  love.graphics.print("Tempo : "..t ,30,90)

  if (gameover == 1) then

    love.graphics.print("Gameover :"..gameover, 30,80)
    
  end

  love.graphics.setColor(255,0,0)
  love.graphics.draw(player,playerx,playery)
 
  love.graphics.setColor(1,255,67)
  love.graphics.rectangle("fill",350,0,30,240)
  love.graphics.rectangle("fill",0,0,30,240)
  love.graphics.rectangle("fill",30,230,320,10)
 
  love.graphics.setColor(0,255,255)
  love.graphics.draw(img,star.sx,star.sy)
       
end
 
function love.update( dt)

  min , seg = tempo.add(dt)

  t = t+ dt

    
  if love.keyboard.isDown("right")   then
    playerx = playerx + 1
    
  end
  
    
 
  if love.keyboard.isDown("left")   then
    playerx = playerx - 1
   
    
  end
 

  if  CheckCollision(playerx,playery,30,30,0,0,30,240) then
    playerx = playerx + 1
  end


  if CheckCollision(playerx,playery,30,30,350,0,30,240) then
    playerx = playerx - 1
  end
 
  
 
  for i,v in ipairs(cont) do

      if CheckCollision(v.bx,v.by,v.bw,v.bh,290,0,30,240) then
          table.remove(cont,i)
      end
       
      if CheckCollision(v.bx,v.by,v.bw,v.bh,0,0,30,240) then
          table.remove(cont,i)
      end
  end
 
  if  CheckCollision(playerx,playery,30,30,star.sx,star.sy,30,30) then

        
    pontos = pontos + 1
    mover()
    if (pontos == t)then gameover= gameover + 1 end  
        
  end   
end

 
function love.keypressed(k)
  if k == " " then
    shoot()
  end
end
 

function mover()
  local position = math.random(1,9)
  star.sx = position*30    

end
---- trabalho 7 co-rotina
--[[ function(direcao)
        if direcao == 'left' then
            rotina.x = 50
        elseif direcao == 'right' then
            rotina.x = 100
        elseif direcao == 'up' then
            rotina.y = 50
        elseif direcao == 'down' then
            rotina.y = 100
        end
    end



    while true do
            coroutine.yield('left')
            coroutine.yield('down')
            coroutine.yield('right')
            coroutine.yield('up')
          
        end
   -- ]]

function shoot()
  shot = {bx = playerx+15,by = playery+15,bw = 5,bh = 5}
  table.insert(cont,shot)
end

 
function CheckCollision(ax1,ay1,aw,ah, bx1,by1,bw,bh)
  local ax2,ay2,bx2,by2 = ax1 + aw, ay1 + ah, bx1 + bw, by1 + bh
  return ax1 < bx2 and ax2 > bx1 and ay1 < by2 and ay2 > by1
end
----co- rotina



