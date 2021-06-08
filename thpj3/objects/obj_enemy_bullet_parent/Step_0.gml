if ( obj_wriggle.bombing || obj_wriggle.respawn ) {
	if ( obj_wriggle.hyper_time ) {
//TODO: create a point item if during a hyper
	}
	instance_destroy();
}

if ( obj_wriggle.emergency ) {
	temp_speed = speed;
	speed = 0;
}
if ( !obj_wriggle.emergency && temp_speed ) {
	speed = temp_speed;
	temp_speed = 0;
}


if ( x < BOUNDARY_LEFT - 128 || x > BOUNDARY_RIGHT + 128 || y < BOUNDARY_TOP - 128 || y > BOUNDARY_BOTTOM + 128 ) {
	instance_destroy();
}