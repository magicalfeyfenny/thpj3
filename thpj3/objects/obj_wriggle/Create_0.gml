lives_current = LIVES_INIT;
bombs_current = BOMBS_INIT;
hyper_current = HYPER_INIT;
score_current = SCORE_ZERO;
score_high = scr_scores( SCORE_READ );

face_dir = RIGHT;

hitbox_rotator = 0;
bombing = 0;
invuln = false;
respawn = 0;
recovery = 0;
emergency = 0;
hyper_time = 0;
hyper_tier = 0;
score_multiply = 1;
h_move = 0;
v_move = 0;
shoot_delay = 0;
x = SPAWN_X;
y = SPAWN_Y;

top_option = instance_create_layer(x,y,"player", obj_options);
with (top_option) {
	side_modifier = TOP;
}

bottom_option = instance_create_layer(x,y,"player", obj_options);
with (bottom_option) {
	side_modifier = BOTTOM;
}

testtext = 1000;