--[[
    Author  :   xim.gz#0
    Date    :   12/17/23    
--]]

XM = {}

-- Waypoint & Blip functions
---@param blipSprite integer
---@param color integer
---@return blip
function XM:CreateMissionPoint(blipX, blipY, blipZ, blipSprite, color)
    local blip = AddBlipForCoord(blipX, blipY, blipZ)
    SetBlipSprite(blip, blipSprite)
    SetBlipColour(blip, color)
    SetBlipRoute(blip, true)
    SetBlipRouteColour(blip, color or 66)
    return blip
end

---@param cX integer
---@param cY integer
---@param cZ integer
---@param title string
---@param sprite integer
---@return blip
function XM:NewBlip(cX, cY, cZ, title, sprite)
    local blip = AddBlipForCoord(cX or 0, cY or 0, cZ or 0)
    SetBlipSprite(blip, sprite or 112)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(title or "x_notitlegiven")
    EndTextCommandSetBlipName(blip)
    return blip
end

-- Other functions 
---@param hash Hash
---@param posX integer
---@param posY integer
---@param posZ integer
---@param heading integer
---@param freeze boolean
---@param invincible boolean
---@param animation string
---@return ped
function XM:CreatePed(hash, posX, posY, posZ, heading, freeze, invincible, animation)
    local ped = CreatePed(1, hash, posX, posY, posZ, heading, false, true)
    FreezeEntityPosition(ped, freeze or true)
    SetEntityInvincible(ped, invincible or true)
    SetBlockingOfNonTemporaryEvents(ped, freeze or true)
    TaskStartScenarioInPlace(ped, animation, 0, true)
    return ped
end


---@param hashString string
---@return Hash
function XM:Hasher(hashString)
    local hash = GetHashKey(hashString)
    while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(30)
    end
    return hash
end

