
event_inherited();

hp_max = 15;
hp = hp_max;

// chase player if found
alert = false;

// distance to start chasing the player
alert_dis = 75;
attack_angle = irandom(360);

// set stop distance
attack_dis = 5;

// animation frame for attack
attack_frame = 6;

can_attack = true;

// delay
attack_cooldown = 75;

damage = 2
knockback_time = 10;

// speed to chase the player
move_speed = 1;

// create path resource
path = path_add();

// set delay for calculating path
calc_path_delay = 30;

// set timer for calculating path
calc_path_timer = irandom(60);