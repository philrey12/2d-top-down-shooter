
switch (state) {
	default:
		reset_variables();
		get_input();
		calc_movement();
		aim_bow();
		check_fire();
		anim();
		break;
	case STATES.KNOCKBACK:
		reset_variables();
		calc_movement();
		aim_bow();
		if knockback_time-- <= 0 state = STATES.IDLE;
		break;
	case STATES.DEAD:
		reset_variables();
		calc_movement();
		if ready_to_restart and mouse_check_button(mb_left) game_restart();
		anim();
		break;
}