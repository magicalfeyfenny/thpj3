if ( hp <= 0 ) {
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