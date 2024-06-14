
function damage_entity(_target_id, _source_id, _damage, _kbtime) {
	// damage target and return dead status
	with(_target_id) {
		if alarm[HURT] > 0 or state == STATES.DEAD exit;
		
		hp -= _damage;
		var _dead = is_dead();
		path_end();
		
		// set knockback distance
		if _dead var _dis = 5 else _dis = 3;
		
		var _dir = point_direction(_source_id.x, _source_id.y, x, y);
		
		hor_speed += lengthdir_x(_dis, _dir);
		ver_speed += lengthdir_y(_dis, _dir);
		
		calc_path_delay = _kbtime;
		alert = true;
		knockback_time = _kbtime
		alarm[HURT] = hurt_time;
		
		if !_dead state = STATES.KNOCKBACK;
		
		image_index = 0;
		return _dead;
	}
}

function is_dead() {
	// check is the instance running is dead
	if state != STATES.DEAD {
		if hp <= 0 {
			state = STATES.DEAD;
			hp = 0;
			image_index = 0;
			
			// set death sound
			switch(object_index) {
				default:
					// play sound
					break;
				case obj_player:
					if instance_exists(my_bow) instance_destroy(my_bow);
					// play sound
					break;
			}
			return true;
		}
	} else {
		return true;
	}
}

function check_if_stopped() {
	if abs(hor_speed) < 0.1 hor_speed = 0;
	if abs(ver_speed) < 0.1 ver_speed = 0;
}

function show_healthbar() {
	// show healthbar above the head
	if hp != hp_max and hp > 0 {
		draw_healthbar(x-7, y-16, x+7, y-14, hp/hp_max*100, $003300, $3232FF, $00B200, 0, 1, 1);
	}
}