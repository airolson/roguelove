require "demo"
require "circles"
require "shadowcasting"

GameStates = {}
GameStates[1] = DemoProgram or {}
GameStates[2] = DemoCircles or {}
GameStates[3] = ShadowCasting or {}

CURRENT = 1

function love.load()
  if GameStates[CURRENT].load then
    GameStates[CURRENT].load()
  end
end

function love.draw()
  if GameStates[CURRENT].draw then
    GameStates[CURRENT].draw()
  end
end

function love.update(dt)
  if GameStates[CURRENT].update then
    GameStates[CURRENT].update(dt)
  end
end

function love.mousepressed(x, y, button)
  if GameStates[CURRENT].mousepressed then
    GameStates[CURRENT].mousepressed(x, y, button)
  end
end

function love.mousereleased(x, y, button)
  if GameStates[CURRENT].mousereleased then
    GameStates[CURRENT].mousereleased(x, y, button)
  end
end

function love.keypressed(key, unicode)
  if key == "1" then
    CURRENT = 1
    if GameStates[CURRENT].load then
      GameStates[CURRENT].load()
    end
  elseif key == "2" then
    CURRENT = 2
    if GameStates[CURRENT].load then
      GameStates[CURRENT].load()
    end
  elseif key == "3" then
    CURRENT = 3
    if GameStates[CURRENT].load then
      GameStates[CURRENT].load()
    end
  elseif GameStates[CURRENT].keypressed then
    GameStates[CURRENT].keypressed(key, unicode)
  end
end
