if ( obj_dialogue.dialogue_mode || instance_exists(obj_boss_parent) ) {
	timeline_running = false;
} else {
	timeline_running = true;
}
effect_create_below(ef_rain, 0, 0, 0, c_teal);