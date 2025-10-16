local colors = require "colors"
local sceneManager = require "sceneManager"

local interact = {}

local x = 300
local y = 200

local has_interaction = false
local has_key = false

function interact.load(option)
  if option then
    has_interaction = true
    if option == 2 then
      has_key = true
    end
  end
end

function interact.update(dt)
end

function interact.draw()
  love.graphics.setColor(colors.black)
  love.graphics.rectangle("fill", x, y, 300, 200)

  love.graphics.setColor(colors.white)

  if not has_interaction then
    love.graphics.print("nothing to interact with ..", x + 20, y + 20)
  elseif not has_key then
    love.graphics.print("need key to open ..", x + 20, y + 20)
  else
    love.graphics.print("opening ..", x + 20, y + 20)
    sceneManager.changeScene(require "end")
  end
end

function interact.keypressed(key)
  if key == "space" or key == "return" then
    sceneManager.popScene()
  end
end

return interact
