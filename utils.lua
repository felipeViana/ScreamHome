local utils = {}

function utils.replace_char(pos, str, r)
  return str:sub(1, pos - 1) .. r .. str:sub(pos + 1)
end

function utils.random(a, b)
  if not a then
    a, b = 0, 1
  end
  if not b then
    b = 0
  end

  return math.floor(a + math.random() * (b - a))
end

function utils.hex2rgb(hex)
  hex = hex:gsub("#", "")
  return {
    tonumber("0x" .. hex:sub(1, 2)) / 255,
    tonumber("0x" .. hex:sub(3, 4)) / 255,
    tonumber("0x" .. hex:sub(5, 6)) / 255
  }
end

return utils
