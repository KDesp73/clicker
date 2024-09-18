#include "raylib.bi"
#include "raymath.bi"
#include "ui.bi"
#include "clicker.bi"

sub drawUpgrades(balance as integer)
end sub
    

sub drawActiveUpgrade(clicker as Clicker)
end sub

sub drawCoinUI(position as Vector2, radius as single)
    DrawCircleV(position, radius*1.1, BLACK)
    DrawCircleV(position, radius, YELLOW)
    dim w as integer = radius*0.5
    dim h as integer = radius*0.5 + radius*0.7
    DrawRectangle(position.x - (w/2), position.y - (h/2), w, h, GetColor(&HDE970BFF))
end sub

#define SQUARE(pos, size) type<Rectangle>(pos.x, pos.y, size, size)
#macro TEXT_BOTTOM_RIGHT(t) 
    dim fontSize as integer = UPGRADE_SIZE / 5
    dim text as const zstring ptr = FormatText(t)
    dim size as integer = MeasureText(text, fontSize)
    DrawText(text, position.x + UPGRADE_SIZE - size - padding - 10, position.y + UPGRADE_SIZE - fontSize - padding, fontSize, WHITE)
#endmacro
#macro TEXT_BOTTOM_LEFT(t) 
    dim fontSize as integer = UPGRADE_SIZE / 5
    dim text as const zstring ptr = FormatText(t)
    dim size as integer = MeasureText(text, fontSize)
    DrawText(text, position.x + padding + 10, position.y + UPGRADE_SIZE - fontSize - padding, fontSize, WHITE)
#endmacro

sub drawUpgrade(byval u as Upgrade, byval position as Vector2)
    dim rect as Rectangle = SQUARE(position, UPGRADE_SIZE)
    dim padding as integer = 10

    DrawRectangleRec(rect, WHITE)
    DrawRectangleRec(SQUARE(Vector2Add(position, type(padding, padding)), UPGRADE_SIZE - 2*padding), GetColor(&Hbd162cFF))

    select case u
    case DOUBLE_ON_CLICK
        drawCoinUI(Vector2Add(position, type(40, 40)), 20)
        drawCoinUI(Vector2Add(position, type(60, 60)), 20)
        TEXT_BOTTOM_RIGHT("x2")
    case TRIPLE_ON_CLICK
        drawCoinUI(Vector2Add(position, type(40, 40)), 20)
        drawCoinUI(Vector2Add(position, type(80, 40)), 20)
        drawCoinUI(Vector2Add(position, type(60, 60)), 20)
        TEXT_BOTTOM_RIGHT("x3")
    case QUADRUPLE_ON_CLICK
        drawCoinUI(Vector2Add(position, type(40, 40)), 20)
        drawCoinUI(Vector2Add(position, type(70, 40)), 20)
        drawCoinUI(Vector2Add(position, type(40, 70)), 20)
        drawCoinUI(Vector2Add(position, type(70, 70)), 20)
        TEXT_BOTTOM_RIGHT("x4")
    end select
    TEXT_BOTTOM_LEFT("[" & u + 1 & "]")
end sub
