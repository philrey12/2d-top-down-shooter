
// apply damage and knockback
var _dir = point_direction(x, y, other.x, other.y);
var _force = force;

with(other) {
	hor_speed = lengthdir_x(_force, _dir);	// push entity away horizontally
	ver_speed = lengthdir_y(_force, _dir);	// push entity away vertically
}

damage_entity(other, id, damage, random_range(45, 60));