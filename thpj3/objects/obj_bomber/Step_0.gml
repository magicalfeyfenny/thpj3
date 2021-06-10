if ( !obj_wriggle.bombing ) {
	instance_destroy();
}

if ( instance_exists( obj_enemy_parent ) ) {
	with( obj_enemy_parent ) {
		hp -= 2;
	}
}