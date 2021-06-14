if ( obj_wriggle.bombing || obj_wriggle.respawn || obj_dialogue.dialogue_mode ) {
	if ( obj_wriggle.hyper_time && !obj_dialogue.dialogue_mode ) {
//TODO: create a point item if during a hyper
	}
	instance_destroy();
}

if ( obj_wriggle.emergency && !temp_speed ) {
	temp_speed = speed;
	speed = 0;
}
if ( !obj_wriggle.emergency && temp_speed ) {
	speed = temp_speed;
	temp_speed = 0;
}

if ( point_distance( x, y, obj_wriggle.x, obj_wriggle.y ) < 64 ) {
	obj_wriggle.hyper_current += .1;
	audio_play_sound(snd_graze, 0, false);
	effect_create_below(ef_spark, obj_wriggle.x, obj_wriggle.y, 0, c_white);
}

if ( x < BOUNDARY_LEFT - 128 || x > BOUNDARY_RIGHT + 128 || y < BOUNDARY_TOP - 128 || y > BOUNDARY_BOTTOM + 128 ) {
	instance_destroy();
}

image_angle = direction;