/// @function:									scr_pattern_fire( _pattern, _speed, _bullet );
/// @param _pattern	{real}
/// @param _speed	{real}
/// @param _bullet	{object}


function scr_pattern_fire( _pattern, _speed, _bullet ) {
	switch ( _pattern ) {
		case PATTERN_STREAM:
			exy = instance_create_layer( x, y, "enemy", _bullet );
			with (exy) {
				speed = _speed;
				friction = -.05 * obj_wriggle.hyper_tier;
				direction = point_direction( x, y, obj_wriggle.x, obj_wriggle.y );
			}
			if ( obj_wriggle.hyper_tier > HYPER_TIER_1 ) {
				exy = instance_create_layer( x, y, "enemy", _bullet );
				with (exy) {
					speed = _speed;
					friction = -.05 * obj_wriggle.hyper_tier;
					direction = point_direction( x, y, obj_wriggle.x, obj_wriggle.y ) + 20;
				}
				exy = instance_create_layer( x, y, "enemy", _bullet );
				with (exy) {
					speed = _speed;
					friction = -.05 * obj_wriggle.hyper_tier;
					direction = point_direction( x, y, obj_wriggle.x, obj_wriggle.y ) - 20;
				}
			}
			break;
		case PATTERN_AIMED_WAVE:
			for ( var i = 0; i < 5 + (obj_wriggle.hyper_tier * 2); i++ ) {
				exy = instance_create_layer( x, y, "enemy", _bullet );
				with (exy) {
					speed = _speed;
					friction = -.05 * obj_wriggle.hyper_tier;
					direction = point_direction( x, y, obj_wriggle.x, obj_wriggle.y ) 
					- (30 + 10 * obj_wriggle.hyper_tier) + ( i * (60 + 10 * obj_wriggle.hyper_tier) / (5 + obj_wriggle.hyper_tier * 2) );
				}
			}
			break;
		default:
			break;
	}
}