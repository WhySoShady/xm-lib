# xm-lib

### Version

v1.0 - 12/17/23

## Description
I made this to make using natives less annoying for myself and published it because I have bad organization
It's also a dependency for all my other public scripts 

## Using xm-lib

If you want to use this scripts functions in any of your scrips add to your fxmanifest.lua

```lua
shared_scripts {
    '@xm-lib/functions.lua'
}
```

This will allow you to use all my native function remakes in your own code

## Support
I do not provide support but you can add me at `xim.gz` on discord and attempt to get ahold of me

## Documentation

### CreateMissionPoint()

| Parameter | Type | Required | Defaults |
|:---------:|:----:|:--------:|:--------:|
|blipX -Z   |int   | yes      |n/a       |
|blipSprite |int   | yes      |n/a       |
|color      |int   | yes      |n/a       |

```lua
function XM:CreateMissionPoint(blipX, blipY, blipZ, blipSprite, color)
    local blip = AddBlipForCoord(blipX, blipY, blipZ)
    SetBlipSprite(blip, blipSprite)
    SetBlipColour(blip, color)
    SetBlipRoute(blip, true)
    SetBlipRouteColour(blip, color or 66)
    return blip
end
```

### NewBlip()

| Parameter | Type | Required |   Defaults   |
|:---------:|:----:|:--------:|:------------:|
|cX-Z       |int   | yes      |0             |
|title      |string| yes      |x_notitlegiven|
|sprite     |int   | yes      |112           |

```lua
function XM:NewBlip(cX, cY, cZ, title, sprite)
    local blip = AddBlipForCoord(cX or 0, cY or 0, cZ or 0)
    SetBlipSprite(blip, sprite or 112)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(title or "x_notitlegiven")
    EndTextCommandSetBlipName(blip)
    return blip
end
```

### CreatePed()

*best used with `XM:Hasher()`*

| Parameter | Type | Required |   Defaults   |
|:---------:|:----:|:--------:|:------------:|
|hash       |Hash  | yes      |n/a           |
|posX-Z     |int   | yes      |n/a           |
|heading    |int   | yes      |n/a           |
|freeze     |bool  | yes      |true          |
|invincible |bool  | yes      |true          |
|animation  |bool  | yes      |true          |

```lua
function XM:CreatePed(hash, posX, posY, posZ, heading, freeze, invincible, animation)
    local ped = CreatePed(1, hash, posX, posY, (posZ)-1, heading, false, true)
    FreezeEntityPosition(ped, freeze or true)
    SetEntityInvincible(ped, invincible or true)
    SetBlockingOfNonTemporaryEvents(ped, freeze or true)
    TaskStartScenarioInPlace(ped, animation, 0, true)
    return ped
end
```

### Hasher()

| Parameter | Type | Required |   Defaults   |
|:---------:|:----:|:--------:|:------------:|
|hashString |string| yes      |n/a           |


```lua
function XM:Hasher(hashString)
    local hash = GetHashKey(hashString)
    while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(30)
    end
    return hash
end
```

### Subtitle()

| Parameter | Type | Required |   Defaults   |
|:---------:|:----:|:--------:|:------------:|
|message    |string| yes      |n/a           |
|duration   |int   | yes      |n/a           |

```lua
function XM:Subtitle(message, duration)
    BeginTextCommandPrint('STRING')
    AddTextComponentString(message)
    EndTextCommandPrint(duration, true)
end
```
