
function calc_entity_movement() {
	// moves enemy and apply drag
	x += hor_speed;
	y += ver_speed;
	hor_speed *= global.drag;
	ver_speed *= global.drag;
	
	check_if_stopped();
}

function check_facing() {
	// check which way we are moving and set facing
	if knockback_time <= 0 {
		var _facing = sign(x - xpos);
		if _facing != 0 facing = _facing;
	}
}

function check_for_player() {
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

function show_hurt() {
	// show hurt sprite when being knocked back
	if knockback_time-- > 0 sprite_index = e_hurt;
}