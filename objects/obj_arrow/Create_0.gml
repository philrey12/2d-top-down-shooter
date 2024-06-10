
damage = 5;
range = 240;
owner_id = noone;
knockback_time = 1;

function arrow_die() {
	// when arrow is destroyed
	speed = 0;
	instance_change(obj_arrow_explode, false);
}