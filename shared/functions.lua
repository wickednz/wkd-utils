Shared = Shared or {}
QBCore = exports["qb-core"]:GetCoreObject()

function Shared.dump(o)
   	if type(o) == 'table' then
	   local s = '{ '
	   for k,v in pairs(o) do
		  if type(k) ~= 'number' then k = '"'..k..'"' end
		  s = s .. '['..k..'] = ' .. Shared.dump(v) .. ','
	   end
	   return s .. '} '
	else
	   return tostring(o)
	end
end

function Shared.round(n)
	return n % 1 >= 0.5 and math.ceil(n) or math.floor(n)
end

function Shared.trim(value)
	if value then
		return (string.gsub(value, "^%s*(.-)%s*$", "%1"))
	else
		return nil
	end
end

-- Plate generator start
local StringCharset = {}
local NumberCharset = {}

for i = 48,  57 do NumberCharset[#NumberCharset+1] = string.char(i) end
for i = 65,  90 do StringCharset[#StringCharset+1] = string.char(i) end
for i = 97, 122 do StringCharset[#StringCharset+1] = string.char(i) end

RandomString = function(length)
    if length <= 0 then return '' end
    return RandomString(length - 1) .. StringCharset[math.random(1, #StringCharset)]
end

RandomInteger = function(length)
    if length <= 0 then return '' end
    return RandomInteger(length - 1) .. NumberCharset[math.random(1, #NumberCharset)]
end 

function Shared.generatePlate()
    return string.upper(RandomString(3) .. RandomInteger(3))
end
-- Plate generator end

