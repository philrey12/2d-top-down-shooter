
if alarm[HURT] > 0 and flash-- < flash_initial/2 {
	// draw white sprite
	gpu_set_fog(1, c_white, 0, 1);
	draw_sprite_ext(sprite_index, image_index, x, y, facing, 1, 0, c_white, 1);
	gpu_set_fog(0, c_white, 0, 1);
	
	// reset flash
	if flash <= 0 flash = flash_initial;
} else {
	draw_sprite_ext(sprite_index, image_index, x, y, facing, 1, 0, c_white, 1);
}

show_healthbar();