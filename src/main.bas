#include "raylib.bi"
#include "coins.bi"
#include "clicker.bi"
#include "upgrades.bi"
#include "ui.bi"


' TODO: Serialize and Deserialize to save and load
dim clicker as Clicker
clicker.coins = Coins()
clicker.coins.init()
clicker.balance = 0 
clicker.activeUpgrade = NONE


InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "Test")
SetTargetFPS(60)
while (WindowShouldClose() = 0)
    dim mousePosition as Vector2 = GetMousePosition()

    ' TODO: remove ` or IsKeyDown(KEY_SPACE)`. Used for testing
    if IsMouseButtonPressed(MOUSE_LEFT_BUTTON) = 1 or IsKeyDown(KEY_SPACE) then
        clicker.balance = clicker.balance+ clicker.activeUpgrade + 2
        for i as integer = 0 to clicker.activeUpgrade + 1
            clicker.coins.spawn(mousePosition)
        next 
    end if

    if IsKeyPressed(KEY_ONE) then
        if clicker.balance >= COST_DOUBLE_ON_CLICK then
            clicker.balance = clicker.balance - COST_DOUBLE_ON_CLICK
            clicker.activeUpgrade = DOUBLE_ON_CLICK
        end if
    elseif IsKeyPressed(KEY_TWO) then
        if clicker.balance >= COST_TRIPLE_ON_CLICK then
            clicker.balance = clicker.balance - COST_TRIPLE_ON_CLICK
            clicker.activeUpgrade = TRIPLE_ON_CLICK
        end if
    elseif IsKeyPressed(KEY_THREE) then
        if clicker.balance >= COST_QUADRUPLE_ON_CLICK then
            clicker.balance = clicker.balance - COST_QUADRUPLE_ON_CLICK
            clicker.activeUpgrade = QUADRUPLE_ON_CLICK
        end if
    end if

    clicker.coins.update(GRAVITY, SCREEN_HEIGHT)

    BeginDrawing()
        ClearBackground(BG_COLOR)

        dim fontSize as integer = 200
        dim text as const zstring ptr = FormatText("%d", clicker.balance)
        DrawCenter(text, fontSize)

        for i as integer = 0 to Upgrade.COUNT-1
            drawUpgrade(i, type(20, (i+1)*20 + i*UPGRADE_SIZE))
        next
        
        clicker.coins.draw()
    EndDrawing()
wend
CloseWindow()

