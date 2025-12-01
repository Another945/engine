/// @description Play the stage music

if global.stream == -1 || global.stream != lvlMusic {
    play_music(lvlMusic,0.7,true);
}

