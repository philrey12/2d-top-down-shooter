
switch(state) {
	case STATES.DEAD:
		image_index = image_number - 1;
		image_speed = 0;
		alarm[2] = 1800;	// remove dead enemies after 30 seconds (30 * 60 = 1800)
		break;
	case STATES.ATTACK:
		image_index = 0;
		state = STATES.IDLE;
		break;
}