/// @function:									scr_pattern_fire( _pattern, _speed, _bullet );
/// @param _pattern	{real}
/// @param _speed	{real}
/// @param _bullet	{object}


function scr_pattern_fire( _pattern, _speed, _bullet ) {
	switch ( _pattern ) {
		case PATTERN_STREAM:
			exy = instance_create_layer( x, y, "enemy", _bullet );
			with (exy) {
				speed = _speed + obj_wriggle.hyper_tier;
				direction = point_direction( x, y, obj_wriggle.x, obj_wriggle.y );
			}
			break;
		default:
			break;
	}
}