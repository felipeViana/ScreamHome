local sceneManager = require "sceneManager"

function love.load()
  sceneManager.changeScene(require "titleScreen")
end

function love.update(dt)
  sceneManager.currentScene.update(dt)
end

function love.draw()
  sceneManager.draw()
end

function love.keypressed(key)
  sceneManager.currentScene.keypressed(key)
end
