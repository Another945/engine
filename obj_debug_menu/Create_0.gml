/// @description Debug Mode Menu

instance_create(x, y, obj_fade_in); //Create a fade in.

page = 0;
option = 0;

subOption = 0;
character = char_x;

for(var i = 0; i <= 200; i++) {
    for(var j = 0; j <= 200; j++) {
        menu[i,j] = "";
        menuOptions[i] = 200;
    }
}

menu[0,0] = "MAIN MENU";
menu[0,1] = "ROOM SELECT";
menu[0,2] = "STAGE SELECT";
menuOptions[0] = 3;

menuOptions[1] = 0;
var rooms = 200;
for(var i = 0; i < rooms; i++) {
    if room_exists(i) {
        menuOptions[1]++;
        menu[1,i] = string_upper(room_get_name(i));
    }
}

