if ( hp <= 0 || obj_dialogue.dialogue_mode ) {
	instance_destroy();
	if ( !obj_dialogue.dialogue_mode ) {
//TODO: point system for kills
	}
}
if ( obj_wriggle.emergency && !temp_speed ) {
	temp_speed = speed;
	speed = 0;
} else if ( !obj_wriggle.emergency && temp_speed ) {
	speed = temp_speed;
	temp_speed = 0;
}