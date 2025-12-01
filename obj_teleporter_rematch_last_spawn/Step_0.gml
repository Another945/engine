/// @description Logic

if instance_exists(obj_rematch_control) {
    if global.rematchCleared {
        var teleporter = instance_create(x, y, obj_teleporter_rematch);
            teleporter.type = 1;
        instance_destroy();
    }
}

