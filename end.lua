local sceneManager = require "sceneManager"

local endScreen = {}

local bg_image

function endScreen.load()
  bg_image = love.graphics.newImage("assets/end.png")
end

function endScreen.update(dt)
end

function endScreen.draw()
  love.graphics.draw(bg_image, 0, 0)
end

function endScreen.keypressed(key)
  if key == "escape" then
    love.event.quit()
  end
end

return endScreen
