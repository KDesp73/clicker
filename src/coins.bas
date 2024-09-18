#include "coins.bi"

constructor Coins()
    this.count = 0
end constructor

destructor Coins()
end destructor


sub Coins.init()
    for i as integer = 0 to this.capacity - 1
        items(i).active = false
    next
end sub

sub Coins.spawn(position as Vector2)
    for i as integer = 0 to this.capacity - 1
        if (not items(i).active) then
            items(i).position.x = position.x
            items(i).position.y = position.y
            items(i).velocity.x = 0
            items(i).velocity.y = -10  ' initial upward velocity
            items(i).lifetime = 0
            items(i).active = 1
            exit sub
        end if
    next
end sub

sub Coins.update(gravity as single, screen_height as integer)
    for i as integer = 0 to this.capacity - 1
        if items(i).active then
            items(i).lifetime += 1
            items(i).position.x += items(i).velocity.x
            items(i).position.y += items(i).velocity.y + 0.5 * gravity * items(i).lifetime
            items(i).velocity.y += gravity

            if items(i).position.y > screen_height then
                items(i).active = 0
            end if
        end if
    next
end sub

sub Coins.draw() 
    for i as integer = 0 to this.capacity - 1
        if items(i).active then
            ' draw_sprite(coin_sprite, items(i).x, coins.items(i).y)
            DrawCircleV(items(i).position, 10.0, YELLOW)
        end if
    next
end sub


