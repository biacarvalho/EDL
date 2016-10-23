function love.load()
  playerx = 200
  playery = 200
  

  star = {sx = 29,sy = 200}
  player = love.graphics.newImage("player.png")
  img = love.graphics.newImage("enemy.png")
  pontos = 0
  
end
local cont = {}

--[[

               trabalho 6

               Identificar valores de dados não primitivos

               1- Enumeração (tipo em que todos os valores possíveis são constantes enumeradas) 

                   Exemplo usando o enum Keyboard :  


                       if love.keyboard.isDown("right") then
                                         playerx = playerx + 1
                       end
 
                        if love.keyboard.isDown("left") then
                              playerx = playerx - 1
                        end

                2- Registro ( conjunto finito de elementos heterogênios e identificado pelo nome )       

                   Exemplo:  star = {sx = 29,sy = 200}

                   Conjunto finito formado pelos elementos sx e sy  e que são acessados pelo seu campo :

                      function mover()
                            local position = math.random(1,9)
                             star.sx = position*30
                      end

                3 - Array (Conjunto infinito de valores homogênios , elementos identificados pela indice(posição) :


                        Criação : local cont = {}
                        Indexação (acesado pelo indice):   
                        for i,v in ipairs(cont) do
                              if CheckCollision(v.bx,v.by,v.bw,v.bh,290,0,30,240) then
                                          table.remove(cont,i)
                               end
       
                              if CheckCollision(v.bx,v.by,v.bw,v.bh,0,0,30,240) then
                                          table.remove(cont,i)
                              end
                        end
              4 - Tupla (Conjunto finito de valores heterogêneos , elementos identicados pela posição)

                 Exemplo:  Eu poderia ter criado uma tupla chamada jogador com o os elementos playerx , playery que seriam inteiros e o nome deles 'jogador' e 'inimigo'.
                 Assim os elementos seriam heretogeneos e poderiam ser acessados pelos indices. Isso tudo com o intuito  de printar na tela quem está ganhando o 
                 jogador ou o inimigo. 


]]
 
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


   if CheckCollision(playerx,playery,30,30,0,0,30,240) then
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
 
  if CheckCollision(playerx,playery,30,30,star.sx,star.sy,30,30) then
    pontos = pontos + 1
        mover()
  -----tentar fazer um else para perder o jogo
             
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

function shoot()
  shot = {bx = playerx+15,by = playery+15,bw = 5,bh = 5}
  table.insert(cont,shot)
end

 
function CheckCollision(ax1,ay1,aw,ah, bx1,by1,bw,bh)
  local ax2,ay2,bx2,by2 = ax1 + aw, ay1 + ah, bx1 + bw, by1 + bh
  return ax1 < bx2 and ax2 > bx1 and ay1 < by2 and ay2 > by1
end
