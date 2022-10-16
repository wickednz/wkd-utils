WKD.Functions = {}

function WKD.Functions.loadBlips(text, location, blipsprite, blipcolour)
	local blip = AddBlipForCoord(location)
	SetBlipSprite(blip, blipsprite)
	SetBlipDisplay(blip, 6)
	SetBlipScale(blip, 0.8)
	SetBlipAsShortRange(blip, true)
	SetBlipColour(blip, tonumber(blipcolour))
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandSetBlipName(blip)
end

function WKD.Functions.DrawText3D(x, y, z, text)
    if text then
        SetTextScale(0.35, 0.35)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextEntry("STRING")
        SetTextCentre(true)
        AddTextComponentString(text)
        SetDrawOrigin(x,y,z, 0)
        DrawText(0.0, 0.0)
        local factor = (string.len(text)) / 370
        DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
        ClearDrawOrigin()
    end
end

--This function is for using your own notify and progress bar. It is passed four variables which are listed below.
--    - text = A string with the notify or progress text. 
--    - time = Time the action takes in ms(5000 = 5 Seconds)
--    - type = A string with primary(default), error or success
--    - progress = A boolean value(true or false). True if it is a progress bar and nil if not.
function WKD.Functions.Notify(text, type, time, progress)
	if progress then 
			QBCore.Functions.Progressbar("doingthings", text, time, false, true, {
				disableMovement = true,
				disableCarMovement = true,
				disableMouse = false,
				disableCombat = true,
			}, {}, {}, {}, function()
			end)
		else
		QBCore.Functions.Notify(text, type, time)
	end
end

--Change these two functions if you use something other than legacyFuel
function WKD.Functions.GetFuel(vehicle)
	local fuel = exports['LegacyFuel']:GetFuel(vehicle)
	return fuel
end

function WKD.Functions.SetFuel(vehicle, amount)
	exports['LegacyFuel']:SetFuel(vehicle, amount)
end

-- This function is triggered when the vehicle is spawned, it is passed the vehicle(entity) and its number plate allowing you to set vehicle keys and or possibly trunk items in ESX.
function WKD.Functions.VehicleSpawned(vehicle, plate)
   
	TriggerEvent("vehiclekeys:client:SetOwner", plate)
    TriggerServerEvent("inventory:server:addTrunkItems", plate, itemtable)
end

-- This function is triggered when a vehicle is stored, it is passed the vehicle(entity) and its number plate.
function WKD.Functions.VehicleStored(vehicle, plate)

end
