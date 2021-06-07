lives_current = LIVES_INIT;
bombs_current = BOMBS_INIT;
hyper_current = HYPER_INIT;

face_dir = RIGHT;

hitbox_rotator = 0;
bombing = 0;
invuln = 0;
recovery = 0;
emergency = 0;
hyper_time = 0;
hyper_tier = 0;
h_move = 0;
v_move = 0;
shoot_delay = 0;

top_option = instance_create_layer(x,y,"Instances", obj_options);
with (top_option) {
	side_modifier = TOP;
}

bottom_option = instance_create_layer(x,y,"Instances", obj_options);
with (bottom_option) {
	side_modifier = BOTTOM;
}