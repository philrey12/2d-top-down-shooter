
var _inst = instance_create_depth(x, y, layer, obj_die);
_inst.sprite_index = spr_explosion;

// Enable screen shake
layer_set_visible("Effect_Screen_Shake", true);

// Create screen shake controller
var _shake_controller = instance_create_layer(x, y, "Effect_Screen_Shake", obj_screen_shake);
_shake_controller.alarm[0] = 30; // Set the alarm to disable screen shake after 1 second (60 steps)

instance_destroy();