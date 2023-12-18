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
I do not provide support but you can add me at `xim.gz` on discord and attempt to get ahold od me

## Documentation

| Parameter | Type | Required |
|:---------:|:----:|:--------:|
|blipX -Z   |table | yes      |
|blipSprite |int   | yes      |
|color      |int   | yes      |

```lua
XM:CreateMissionPoint(blipX, blipY, blipZ, blipSprite, color)
```
