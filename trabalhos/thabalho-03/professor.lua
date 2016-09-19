function love.load()
  player = {}
  player.x = 0
  player.y = 550
  player.bullets = {}
  player.cooldown = 20
  player.speed = 10
  player.fire = function()
    if player.cooldown <= 0 then
      player.cooldown = 20
      bullet = {}
      bullet.x = player.x + 35
      bullet.y = player.y
      table.insert(player.bullets, bullet)
    end
  end
end

function love.update(dt)


  createEnemyTimerMax = 0.4
  createEnemyTimer = createEnemyTimerMax
  enemies = {}
  enemyImg = love.graphics.newImage('enemy.png')

  createEnemyTimer = createEnemyTimer - (1 * dt)
  if createEnemyTimer < 0 then
      createEnemyTimer = createEnemyTimerMax

      -- Create an enemy
        randomNumber = math.random(10, love.graphics.getWidth() - 10)
        newEnemy = { x = randomNumber, y = -10, img = enemyImg }
        table.insert(enemies, newEnemy)
  end      
  for i, enemy in ipairs(enemies) do
       enemy.y = enemy.y + (200 * dt)

      if enemy.y > 850 then -- remove enemies when they pass off the screen
       table.remove(enemies, i)
       end
   end

  player.cooldown = player.cooldown - 1

  if love.keyboard.isDown("right") then
    player.x = player.x + player.speed
  elseif love.keyboard.isDown("left") then
    player.x = player.x - player.speed
  end

  if love.keyboard.isDown("up") then
    player.fire()
  end

  for i,b in ipairs(player.bullets) do
    if b.y < -10 then
      table.remove(player.bullets, i)
    end
    b.y = b.y - 10
  end
end

function love.draw()
  -- draw the player
  love.graphics.setColor(0, 0, 255)
  love.graphics.rectangle("fill", player.x, player.y, 80, 20)


  -- draw bullets
  love.graphics.setColor(255, 255, 255)
  for _,b in pairs(player.bullets) do
    love.graphics.rectangle("fill", b.x, b.y, 10, 10)
  end
  for i, enemy in ipairs(enemies) do
      love.graphics.rectangle("fill", enemy.x, enemy.y,10,10)
   end

   love.graphics.print("Score: "..points,30,70)
end