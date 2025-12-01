/// @description Do something when being destroy

if global.frozen {
    global.frozen = false;
    global.saberLag = false;
}
instance_destroy();

