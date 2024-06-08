
function check_for_player(){
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
			var _found_player = mp_grid_path(global.mp_grid, path, x, y, obj_player.x, obj_player.y, choose(0, 1));
		
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