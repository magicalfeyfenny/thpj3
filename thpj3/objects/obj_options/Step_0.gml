if ( keyboard_check( vk_shift ) ) {
	x_target = obj_wriggle.x + ( obj_wriggle.face_dir * OPTION_FORWARD );
	y_target = obj_wriggle.y + ( side_modifier * OPTION_SIDE_FOCUS );
} else {
	x_target = obj_wriggle.x + ( obj_wriggle.face_dir * OPTION_FORWARD * .75 );
	y_target = obj_wriggle.y + ( side_modifier * OPTION_SIDE_UNFOC );
}


if ( point_distance(x, y, x_target, y_target) >= 6 ) {
	move_towards_point( x_target, y_target, 5 );
} else {
	x = x_target;
	y = y_target;
}