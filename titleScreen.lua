local sceneManager = require "sceneManager"

local title = {}

local bg_image

function title.load()
  bg_image = love.graphics.newImage("assets/title.png")
end

function title.update(dt)
end

function title.draw()
  love.graphics.draw(bg_image, 0, 0)
end

function title.keypressed(key)
  if key == "return" then
    sceneManager.changeScene(require "game")
  end

  if key == "escape" then
    love.event.quit()
  end
end

return title
