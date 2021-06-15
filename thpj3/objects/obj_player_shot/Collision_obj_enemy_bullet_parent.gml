if ( obj_wriggle.hyper_time && damage > 5 ) {
	with (other) {
		instance_destroy();
	}
	damage--;
	obj_wriggle.score_multiply++;
}