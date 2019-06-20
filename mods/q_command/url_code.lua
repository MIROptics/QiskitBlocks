-- TODO: Remove these lines if HTTP GET breaks
local register_global_module_table = false
local global_module_name = 'url_code'


url_code = { version = "1.0" }

if register_global_module_table then
  _G[global_module_name] = url_code
end


local char_to_hex = function(c)
  return string.format("%%%02X", string.byte(c))
end

function url_code.urlencode(url)
  if url == nil then
    return
  end
  url = url:gsub("\n", "\r\n")
  url = url:gsub("([^%w ])", char_to_hex)
  url = url:gsub(" ", "+")
  return url
end

local hex_to_char = function(x)
  return string.char(tonumber(x, 16))
end

local urldecode = function(url)
  if url == nil then
    return
  end
  url = url:gsub("+", " ")
  url = url:gsub("%%(%x%x)", hex_to_char)
  return url
end
