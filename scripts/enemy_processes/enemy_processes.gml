
function calc_entity_movement() {
	// moves enemy and apply drag
	x += hor_speed;
	y += ver_speed;
	hor_speed *= global.drag;
	ver_speed *= global.drag;
	
	check_if_stopped();
}

function calc_knockback_movement() {
	// moves enemy and apply drag
	x += hor_speed;
	y += ver_speed;
	hor_speed *= 0.91;
	ver_speed *= 0.91;
	
	check_if_stopped();
	
	if knockback_time <= 0 state = STATES.IDLE;
}

function check_facing() {
	// check which way we are moving and set facing
	if knockback_time <= 0 {
		var _facing = sign(x - xpos);
		if _facing != 0 facing = _facing;
	}
}

function check_for_player() {
	// check player if dead
	if obj_player.state == STATES.DEAD exit;
	
	// check if player is close enough to start chasing them
	var _dis = distance_to_object(obj_player);
	
	// check alert distance
	if ((_dis <= alert_dis) or alert) and _dis > attack_dis {
		alert = true;
		
		// calculate path
		if calc_path_timer-- <= 0 {
			// reset timer
			calc_path_timer = calc_path_delay;
		
			// make a path to the player if found
			if x == xpos and y == ypos var _type = 0 else _type = 1;
			var _found_player = mp_grid_path(global.mp_grid, path, x, y, obj_player.x, obj_player.y, _type);
		
			// start path to reach the player
			if _found_player {
				path_start(path, move_speed, path_action_stop, false);
			}
		}
	} else {
		// if close enough to attack player
		if _dis <= attack_dis {
			path_end();
			state = STATES.ATTACK;
		}
	}
}

function enemy_anim() {
	switch (state) {
		case STATES.IDLE:
			sprite_index = e_idle;
			show_hurt();
			break;
		case STATES.MOVE:
			sprite_index = e_walk;
			show_hurt();
			break;
		case STATES.ATTACK:
			sprite_index = e_attack;
			break;
		case STATES.KNOCKBACK:
			show_hurt();
			break;
		case STATES.DEAD:
			sprite_index = e_dead;
			break;
	}
	
	// set depth
	depth = -bbox_bottom;
	
	// update previous position
	xpos = x;
	ypos = y;
}

function perform_attack() {
	// attack player when at the correct animation frame
	if image_index >= attack_frame and can_attack {
		can_attack = false;
		alarm[0] = attack_cooldown;
		
		// get direction
		var _dir = point_direction(x, y, obj_player.x, obj_player.y);
		
		// get position
		var _xx = x + lengthdir_x(attack_dis, _dir);
		var _yy = y + lengthdir_y(attack_dis, _dir);
		
		// create hitbox
		var _inst = instance_create_layer(_xx, _yy, "Instances", obj_enemy_hitbox);
		_inst.owner_id = id;
		_inst.damage = damage;
		_inst.knockback_time = knockback_time;
	}
}

function show_hurt() {
	// show hurt sprite when being knocked back
	if knockback_time-- > 0 sprite_index = e_hurt;
}