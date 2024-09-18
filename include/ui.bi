#pragma once
#include "raylib.bi"

#macro DrawCenter(text, fontSize)
    dim size as integer = MeasureText(text, fontSize)
    DrawText(text, (SCREEN_WIDTH - size) / 2, (SCREEN_HEIGHT - fontSize) / 2, fontSize, WHITE)
#endmacro


declare sub drawUpgrades()
declare sub drawActiveUpgrade()
