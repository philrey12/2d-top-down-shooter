
switch (state) {
	default:
		reset_variables();
		get_input();
		calc_movement();
		check_fire();
		anim();
		
		break;
}