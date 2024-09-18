#pragma once
#include "raylib.bi"
#include "clicker.bi"
#include "upgrades.bi"

#macro DrawCenter(text, fontSize)
    dim size as integer = MeasureText(text, fontSize)
    DrawText(text, (SCREEN_WIDTH - size) / 2, (SCREEN_HEIGHT - fontSize) / 2, fontSize, WHITE)
#endmacro

const SCREEN_FACTOR = 80
const SCREEN_WIDTH as integer = (16*SCREEN_FACTOR)
const SCREEN_HEIGHT = (9*SCREEN_FACTOR)

#define GRAVITY 0.5
#define BG_COLOR GetColor(&H181818FF)
#define UPGRADE_SIZE (SCREEN_HEIGHT/(Upgrade.COUNT+2))

declare sub drawUpgrades(balance as integer)
declare sub drawActiveUpgrade(clicker as Clicker)
declare sub drawUpgrade(byval u as Upgrade, byval position as Vector2)
