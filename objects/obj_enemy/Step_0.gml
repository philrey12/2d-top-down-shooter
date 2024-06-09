
switch (state) {
	case STATES.IDLE:
		check_for_player();
		if path_index != -1 state = STATES.MOVE;
		enemy_anim();
		break;
	case STATES.MOVE:
		check_for_player();
		check_facing();
		if path_index == -1 state = STATES.IDLE;
		enemy_anim();
		break;
	case STATES.ATTACK:
		enemy_anim();
		break;
	case STATES.DEAD:
		enemy_anim();
		break;
}