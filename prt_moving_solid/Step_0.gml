/// @description Logic

if inside_view()
    active = true;

if !global.frozen && active {
    x += xspeed;
    y += yspeed;
}

