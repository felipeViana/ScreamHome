function love.conf(t)
  t.window.title = "Scream Home"
  t.version = "11.5"
  t.window.width = 1280
  t.window.height = 720

  t.modules.image = true

  t.accelerometerjoystick = false

  t.modules.joystick = false
  t.modules.physics = false
  t.modules.mouse = false
  t.modules.thread = false
  t.modules.touch = false
  t.modules.system = false
  t.modules.video = false

  t.console = false
end
