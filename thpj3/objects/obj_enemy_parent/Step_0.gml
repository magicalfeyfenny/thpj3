if ( obj_dialogue.dialogue_mode || y < BOUNDARY_TOP - 160 || y > BOUNDARY_BOTTOM + 160 || x < BOUNDARY_LEFT - 160 || x > BOUNDARY_RIGHT + 160 ) {
	instance_destroy();
}
if (hp <= 0 ) {
	instance_destroy();
	//TODO: point system for kills
}
if ( obj_wriggle.emergency && !temp_speed ) {
	temp_speed = speed;
	speed = 0;
} else if ( !obj_wriggle.emergency && temp_speed ) {
	speed = temp_speed;
	temp_speed = 0;
}