
can_attack = false;

state = STATES.IDLE;

// initialize previous position
xpos = x;
ypos = y;
facing = 1;
hor_speed = 0;
ver_speed = 0;

// how long we are knocked back for
knockback_time = 0;

// hurt frames
hurt_time = 30;

flash_initial = 16;
flash = flash_initial/2;