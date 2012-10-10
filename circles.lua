require "arc45"

IgsCircles = {}

function IgsCircles.load()
  IgsCircles.MAXRAD = 20
  IgsCircles.BOXSIZE = 10

  IgsCircles.CurrentRadius = 6

  IgsCircles.CurrentAlgorithm = holes45

  local height = (2 * IgsCircles.MAXRAD + 3) * IgsCircles.BOXSIZE
  local width = height

  love.graphics.setMode(height, width)
end

function IgsCircles.draw()
  local points = IgsCircles.CurrentAlgorithm(IgsCircles.CurrentRadius)

  for i=1,#points do
    local x, y = unpack(points[i])
    IgsCircles.drawBoxes(x, y)
  end

  local center = IgsCircles.MAXRAD + 1
  love.graphics.rectangle("fill",
                          center * IgsCircles.BOXSIZE,
                          center * IgsCircles.BOXSIZE,
                          IgsCircles.BOXSIZE,
                          IgsCircles.BOXSIZE)
end

function IgsCircles.drawBoxes(x, y)
  local center = IgsCircles.MAXRAD + 1
  local bx = center * IgsCircles.BOXSIZE
  local by = center * IgsCircles.BOXSIZE
  local px = x * IgsCircles.BOXSIZE
  local py = y * IgsCircles.BOXSIZE
  love.graphics.rectangle("fill", bx + px, by + py, IgsCircles.BOXSIZE, IgsCircles.BOXSIZE)
  love.graphics.rectangle("fill", bx + px, by - py, IgsCircles.BOXSIZE, IgsCircles.BOXSIZE)
  love.graphics.rectangle("fill", bx - px, by + py, IgsCircles.BOXSIZE, IgsCircles.BOXSIZE)
  love.graphics.rectangle("fill", bx - px, by - py, IgsCircles.BOXSIZE, IgsCircles.BOXSIZE)
  love.graphics.rectangle("fill", bx + py, by + px, IgsCircles.BOXSIZE, IgsCircles.BOXSIZE)
  love.graphics.rectangle("fill", bx + py, by - px, IgsCircles.BOXSIZE, IgsCircles.BOXSIZE)
  love.graphics.rectangle("fill", bx - py, by + px, IgsCircles.BOXSIZE, IgsCircles.BOXSIZE)
  love.graphics.rectangle("fill", bx - py, by - px, IgsCircles.BOXSIZE, IgsCircles.BOXSIZE)
end

function IgsCircles.keypressed(key, unicode)
  if key == "p" then
    IgsCircles.CurrentAlgorithm = points45
  elseif key == "h" then
    IgsCircles.CurrentAlgorithm = holes45
  elseif key == "i" then
    IgsCircles.CurrentAlgorithm = arc45
  elseif key == "up" then
    IgsCircles.CurrentRadius = math.min(IgsCircles.CurrentRadius + 1, IgsCircles.MAXRAD)
  elseif key == "down" then
    IgsCircles.CurrentRadius = math.max(IgsCircles.CurrentRadius - 1, 1)
  end
end

function IgsCircles.mousepressed(x, u, button)
  if button == "wd" then
    IgsCircles.CurrentRadius = math.max(IgsCircles.CurrentRadius - 1, 1)
  elseif button == "wu" then
    IgsCircles.CurrentRadius = math.min(IgsCircles.CurrentRadius + 1, IgsCircles.MAXRAD)
  end
end
