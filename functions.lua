WKD.Functions = {}

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

function WKD.Functions.dump(o)
	if type(o) == 'table' then
	   local s = '{ '
	   for k,v in pairs(o) do
		  if type(k) ~= 'number' then k = '"'..k..'"' end
		  s = s .. '['..k..'] = ' .. dump(v) .. ','
	   end
	   return s .. '} '
	else
	   return tostring(o)
	end
end

function WKD.Functions.round(n)
	return n % 1 >= 0.5 and math.ceil(n) or math.floor(n)
end


function WKD.Functions.testFunction() 
    return true
end