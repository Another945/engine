/// @description Set menu options
if type == 0 {
    menu[0] = "Save";
    menu[1] = "Continue without saving";
    menu[2] = "Go to title screen";
}
else if type == 1 {
    menu[0] = "Continue";
    menu[1] = "Stage select";
    menu[2] = "Save";
}

optionMax = array_length_1d(menu)-1;

