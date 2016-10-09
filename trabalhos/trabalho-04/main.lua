function love.load()-- - Nome: function , propriedade: sintaxe , Binding time: design da linguagem
  playerx = 200-- Explicação: Function é uma palavra reservada de lua e é definida  em tempo de design da linguagem.
  playery = 200
  -- Nome: variável "playery" , Propriedade: valor da variável , Binding time: execução,  Explicação: O valor 200 só será atribuído a variável em tempo de execução


  star = {sx = 29,sy = 200}
  player = love.graphics.newImage("player.png")
  img = love.graphics.newImage("enemy.png") 

  
end

     local pontos = 0

  -- Nome: variável "pontos"
  -- Propriedade: endereço
  -- Binding time: execução
  -- Explicação: Por ser uma variável local, 
  -- seu endereço só é determinado em tempo de execução.

   local  cont = {}
function love.draw()
  love.graphics.setBackgroundColor(0, 0 ,255)
  for i,v in ipairs(cont) do
    love.graphics.setColor(0,0,0)
    love.graphics.rectangle("fill",v.bx,v.by,4,4)
        v.bx = v.bx+4
  end
  love.graphics.setColor(0,255,255)
  
  love.graphics.print("Pontuação: "..pontos,30,70)
  love.graphics.setColor(255,0,0)
  love.graphics.draw(player,playerx,playery)
 
  love.graphics.setColor(1,255,67)
  love.graphics.rectangle("fill",350,0,30,240)
  love.graphics.rectangle("fill",0,0,30,240)
  love.graphics.rectangle("fill",30,230,320,10)
 
  love.graphics.setColor(0,255,255)
  love.graphics.draw(img,star.sx,star.sy)
end
 
function love.update(dt)
  if love.keyboard.isDown("right") then
    playerx = playerx + 1  
  end
 
  if love.keyboard.isDown("left") then
    playerx = playerx - 1
  end
 

   if CheckCollision(playerx,playery,30,30,0,0,30,240) then-- Nome: CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2), Propriedade : design da linguagem, Binding Time : design
    playerx = playerx + 1-----------------------------------Explicação : o formato dessa função foi definida no design da linguagem , com x1,y1 are the left-top coords of the first box
  end------------------------------------------------------- while w1,h1 are its width and height. x2,y2,w2 & h2 are the same, but for the second box


  if CheckCollision(playerx,playery,30,30,350,0,30,240) then
    playerx = playerx - 1

    -- Nome: caracter "-"
      -- Propriedade: semântica
      -- Binding time: compilação
      -- Explicação: Dependendo do tipo dos operandos  a instrução de subtração é feita no compile time que essa forma é definida.
  end
 
  
 
  for i,v in ipairs(cont) do
    if CheckCollision(v.bx,v.by,v.bw,v.bh,290,0,30,240) then
          table.remove(cont,i)
        end
       
        if CheckCollision(v.bx,v.by,v.bw,v.bh,0,0,30,240) then
          table.remove(cont,i)
        end
  end
 
  if CheckCollision(playerx,playery,30,30,star.sx,star.sy,30,30) then
    pontos = pontos + 1
        mover()
  -----tentar fazer um else para perder o jogo
             
  end
end
 
function love.keypressed(k) 
  if k == " " then--- Nome: sinal de igual "==" , propriedade : semântica , binding time : compilação , Explicação: substitui um sinal de igual no início de uma
----------------------linha por um return no memometo de interpretação da linguagem
    shoot()
  end
end

-- Nome: palavra reservada "end"
-- Propriedade: implementação
-- Binding time: design da linguagem
-- Explicação: Durante o design da linguagem, decidiu-se que
-- blocos de código seriam finalizados por essa alavra reservada.

 

function mover() 
  local position = math.random(1,9)

  -- Nome: função "random" da biblioteca math
  -- Propriedade: biblioteca
  -- Binding time: compilação
  -- Explicação: Durante o tempo de compilação  é  recuperada a implementação dessa função.
  

  star.sx = position*30
end

function shoot()
  shot = {bx = playerx+15,by = playery+15,bw = 5,bh = 5}
  table.insert(cont,shot)
end

 
function CheckCollision(ax1,ay1,aw,ah, bx1,by1,bw,bh)
  local ax2,ay2,bx2,by2 = ax1 + aw, ay1 + ah, bx1 + bw, by1 + bh
  return ax1 < bx2 and ax2 > bx1 and ay1 < by2 and ay2 > by1
end

