/// @description Check for boss

if instance_exists(prt_boss) {
    with prt_boss {
        if bossID == other.ID {
            myX = other.x;
            myY = other.y-16;
        }
    }
}

