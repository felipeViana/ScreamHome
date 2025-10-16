local battle = {}

local zombieSprite

local option = 0

function battle.load()
  zombieSprite = love.graphics.newImage("assets/zombie.png")
end

function battle.update(dt)
end

function battle.draw()
  love.graphics.clear()
  love.graphics.print("in battle!")

  love.graphics.push()
  love.graphics.scale(8)

  love.graphics.draw(zombieSprite, 75, 25)

  love.graphics.pop()

  love.graphics.print(">", 35, 550 + 50 * option)

  love.graphics.print("Attack", 50, 550) -- 0
  love.graphics.print("Guard", 50, 550 + 50) -- 1
  love.graphics.print("Run", 50, 550 + 50 * 2) -- 2

  -- enemy hp

  -- player hp
end

function battle.keypressed(key)
  if key == "down" then
    option = option + 1
  end

  if key == "up" then
    option = option - 1
  end

  if option < 0 then
    option = 2
  end
  if option > 2 then
    option = 0
  end

  if key == "space" then
  -- use selected option
  end

  if key == "escape" then
    love.event.quit()
  end
end

return battle
