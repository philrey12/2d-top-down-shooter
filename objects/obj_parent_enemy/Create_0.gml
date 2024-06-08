// chase player if found
alert = false;

// distance to start chasing the player
alert_dis = 100;

// set stop distance
attack_dis = 20;

// speed to chase the player
move_speed = 1;

// create path resource
path = path_add();

// set delay for calculating path
calc_path_delay = 30;

// set timer for calculating path
calc_path_timer = irandom(60);