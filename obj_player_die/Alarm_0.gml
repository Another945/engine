/// @description Restart the level

global._lives--;

if global._lives >= 0
    fade_to_room(room);
else {
    global.myRoom = room;
    fade_to_room(rm_save_game);
}

