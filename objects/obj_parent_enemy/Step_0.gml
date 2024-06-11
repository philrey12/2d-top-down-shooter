
switch (state) {
	case STATES.IDLE:
		calc_entity_movement();
		check_for_player();
		if path_index != -1 state = STATES.MOVE;
		enemy_anim();
		break;
	case STATES.MOVE:
		calc_entity_movement();
		check_for_player();
		check_facing();
		if path_index == -1 state = STATES.IDLE;
		enemy_anim();
		break;
	case STATES.KNOCKBACK:
		calc_knockback_movement();
		enemy_anim();
		break;
	case STATES.ATTACK:
		calc_entity_movement();
		enemy_anim();
		break;
	case STATES.DEAD:
		calc_entity_movement();
		enemy_anim();
		break;
}