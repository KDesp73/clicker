#include "raylib.bi"
#include "coins.bi"

const SCREEN_FACTOR = 80
const SCREEN_WIDTH = (16*SCREEN_FACTOR)
const SCREEN_HEIGHT = (9*SCREEN_FACTOR)

#define GRAVITY 0.5
type Clicker 
    coins as Coins
    balance as integer
end type


dim clicker as Clicker
clicker.coins.init()
clicker.balance = 0

print "Capacity: " & clicker.coins.capacity

InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "Test")
SetTargetFPS(60)
while (WindowShouldClose() = 0)
    dim mousePosition as Vector2 = GetMousePosition()

    ' TODO: remove ` or IsKeyDown(KEY_SPACE)`. Used for testing
    if IsMouseButtonPressed(MOUSE_LEFT_BUTTON) = 1 or IsKeyDown(KEY_SPACE) then
        clicker.balance = clicker.balance+1
        clicker.coins.spawn(mousePosition)
    end if

    clicker.coins.update(GRAVITY, SCREEN_HEIGHT)

    BeginDrawing()
        ClearBackground(type(&H18, &H18, &H18))
        DrawText(FormatText("Coins: %d", clicker.balance), 20, 20, 20, WHITE)
        clicker.coins.draw()
    EndDrawing()
wend
CloseWindow()

