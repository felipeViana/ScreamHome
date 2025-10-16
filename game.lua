local sceneManager = require "sceneManager"

local game = {}

local characterSprite
local wallTile
local doorTile
local houseWallTile
local keySprite

local characterPosition = {["x"] = 0, ["y"] = 140}
local characterVelocity = {["x"] = 0, ["y"] = 0}
local characterSpeed = 3

local keyPosition = {["x"] = 260, ["y"] = 20}

local doorPosition = {["x"] = 100, ["y"] = 100}

local gotKey = false

local timeForNextBattle = 1
local passedTimeBattle = 0

function game.load()
  characterSprite = love.graphics.newImage("assets/character.png")

  wallTile = love.graphics.newImage("assets/wall.png")
  doorTile = love.graphics.newImage("assets/door.png")
  houseWallTile = love.graphics.newImage("assets/house_wall.png")
  keySprite = love.graphics.newImage("assets/key.png")

  -- sceneManager.changeScene(require "titleScreen")
end

function game.update(dt)
  passedTimeBattle = passedTimeBattle + dt
  -- if passedTimeBattle > timeForNextBattle then
  --   sceneManager.pushScene(require "battle")
  -- end

  characterVelocity.x = 0
  characterVelocity.y = 0

  if love.keyboard.isDown("up") then
    characterVelocity.y = -characterSpeed
  end
  if love.keyboard.isDown("down") then
    characterVelocity.y = characterSpeed
  end

  if love.keyboard.isDown("left") then
    characterVelocity.x = -characterSpeed
  end
  if love.keyboard.isDown("right") then
    characterVelocity.x = characterSpeed
  end

  local oldX = characterPosition.x
  local oldY = characterPosition.y

  characterPosition.x = characterPosition.x + characterVelocity.x
  characterPosition.y = characterPosition.y + characterVelocity.y

  -- limit character position inside game map
  if characterPosition.x <= 20 then
    characterPosition.x = 20
  elseif characterPosition.x >= 280 then
    characterPosition.x = 280
  end

  if characterPosition.y <= 20 then
    characterPosition.y = 20
  elseif characterPosition.y >= 140 then
    characterPosition.y = 140
  end

  -- collision with wall tiles
  if
    characterPosition.x >= 68 - 10 and characterPosition.y >= 68 - 12 and characterPosition.x <= 132 + 12 and
      characterPosition.y <= 132 - 20
   then
    characterPosition.x = oldX
    characterPosition.y = oldY
  end

  -- get key if close enough
  if math.abs(characterPosition.x - keyPosition.x) < 10 and math.abs(characterPosition.y - keyPosition.y) < 10 then
    gotKey = true
  end
end

function game.draw()
  love.graphics.push()
  love.graphics.scale(4)

  -- background
  love.graphics.setColor(139 / 255, 90 / 255, 43 / 255, 1.0)
  love.graphics.rectangle("fill", 20, 20, 280, 140)

  love.graphics.setColor(1, 1, 1) -- reset color

  -- map tiles
  for x = 20, 300, 16 do
    love.graphics.draw(wallTile, x, 4)
  end
  for x = 20, 300, 16 do
    love.graphics.draw(wallTile, x, 160)
  end
  for y = 20, 160, 16 do
    love.graphics.draw(wallTile, 4, y)
  end
  for y = 20, 160, 16 do
    love.graphics.draw(wallTile, 300, y)
  end

  -- house
  love.graphics.draw(houseWallTile, 100 - 16 * 2, 100)
  love.graphics.draw(houseWallTile, 100 - 16, 100)

  love.graphics.draw(houseWallTile, 100 - 16 * 2, 100 - 16)
  love.graphics.draw(houseWallTile, 100 - 16, 100 - 16)

  love.graphics.draw(houseWallTile, 100 - 16 * 2, 100 - 32)
  love.graphics.draw(houseWallTile, 100 - 16, 100 - 32)

  love.graphics.draw(houseWallTile, 100, 100 - 16)
  love.graphics.draw(houseWallTile, 100, 100 - 32)

  love.graphics.draw(houseWallTile, 100 + 16 * 2, 100)
  love.graphics.draw(houseWallTile, 100 + 16, 100)

  love.graphics.draw(houseWallTile, 100 + 16 * 2, 100 - 16)
  love.graphics.draw(houseWallTile, 100 + 16, 100 - 16)

  love.graphics.draw(houseWallTile, 100 + 16 * 2, 100 - 32)
  love.graphics.draw(houseWallTile, 100 + 16, 100 - 32)
  -- door
  love.graphics.draw(doorTile, doorPosition.x, doorPosition.y)

  -- character
  love.graphics.draw(characterSprite, characterPosition.x, characterPosition.y)

  -- key
  if not gotKey then
    love.graphics.draw(keySprite, keyPosition.x, keyPosition.y)
  end

  love.graphics.pop()

  -- love.graphics.print(characterPosition.x, 0, 0)
  -- love.graphics.print(characterPosition.y, 0, 20)
end

function game.keypressed(key)
  if key == "space" then
    -- open popup

    if math.abs(characterPosition.x - doorPosition.x) < 10 and math.abs(characterPosition.y - doorPosition.y) < 15 then
      -- try to open door if close enough
      if gotKey then
        sceneManager.pushScene(require "interact", 2)
      else
        sceneManager.pushScene(require "interact", 1)
      end
    else
      -- nothing to interact
      sceneManager.pushScene(require "interact")
    end
  end

  if key == "escape" then
    love.event.quit()
  end
end

return game
