/// @description The boss intro

alarm[0] = 380; //Go to my room.

instance_create(x, y, obj_fade_in);
play_music(bgm_stage_start, 0.7, false);

switch global.myBoss {
    case(0): name = "Template Boss 1"; break;
    case(1): name = ""; break;
    case(2): name = ""; break;
    case(3): name = ""; break;
    case(4): name = ""; break;
    case(5): name = ""; break;
    case(6): name = ""; break;
    case(7): name = ""; break;
}

