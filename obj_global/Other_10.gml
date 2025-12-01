/// @description Change screen size

switch global.screen_size {
    case(0):
        window_set_fullscreen(false);
        window_set_size(global.screen_width,global.screen_height);
    break;
    case(1):
        window_set_fullscreen(false);
        window_set_size(global.screen_width*2,global.screen_height*2);
    break;
    case(2):
        window_set_fullscreen(false);
        window_set_size(global.screen_width*3,global.screen_height*3);
    break;
    case(3):
        window_set_fullscreen(false);
        window_set_size(global.screen_width*4,global.screen_height*4);
    break;
    case(4): window_set_fullscreen(true); break;
}

alarm[0] = 1; //Center the window

