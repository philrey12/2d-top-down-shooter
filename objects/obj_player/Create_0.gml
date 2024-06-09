
event_inherited();

walk_speed = 1.5;

// bow
aim_dir = 0;
bow_dis = 12;
fire_rate = 30;
can_fire = true;
arrow_speed = 8;

my_bow = instance_create_layer(x, y, "Instances", obj_bow);

// cursor
cursor_sprite = spr_cursor;
window_set_cursor(cr_none);