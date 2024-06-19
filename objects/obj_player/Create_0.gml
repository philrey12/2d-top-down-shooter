
event_inherited();

walk_speed = 2;
hp_max = 10;
hp = hp_max;

// bow
aim_dir = 0;
bow_dis = 12;
fire_rate = 30;
can_attack = true;
arrow_speed = 8;

my_bow = instance_create_layer(x, y, "Instances", obj_bow);

// set custom cursor
cursor_sprite = spr_cursor;
window_set_cursor(cr_none);

// set restart
ready_to_restart = false;

// bomb
can_throw_bomb = true;
bomb_cooldown = 120;
bomb_power= 8;	// throw distance