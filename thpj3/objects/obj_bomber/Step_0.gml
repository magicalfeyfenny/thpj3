if ( !obj_wriggle.bombing ) {
	instance_destroy();
}

if ( instance_exists( obj_enemy_parent ) ) {
	with( obj_enemy_parent ) {
		if ( variable_instance_exists( self.id, "invuln" ) ) {
			if ( !invuln ) {
				hp -= 2;
			}
		} else {
			hp -= 2;
		}
	}
}