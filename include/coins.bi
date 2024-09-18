#pragma once
#include "raylib.bi"

type Coin
    position as Vector2 
    velocity as Vector2 
    lifetime as single 
    active as boolean 
end type

type Coins
    as integer count
    as integer capacity
    as Coin items(100)

    declare constructor()
    declare destructor()

    declare sub draw()
    declare sub update(gravity as single, screen_height as integer)
    declare sub spawn(position as Vector2)
    declare sub init()
end type

