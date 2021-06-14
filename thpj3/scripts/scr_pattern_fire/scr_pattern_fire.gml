/// @function:									scr_pattern_fire( _pattern, _speed, _bullet );
/// @param _pattern	{real}
/// @param _speed	{real}
/// @param _bullet	{object}


function scr_pattern_fire( _pattern, _speed, _bullet ) {
	switch ( _pattern ) {
		case PATTERN_STREAM:
			audio_play_sound( snd_enemy_bullet, 1, false );
			exy = instance_create_layer( x, y, "enemy", _bullet );
			with (exy) {
				speed = _speed;
				friction = -.02 * obj_wriggle.hyper_tier;
				direction = point_direction( x, y, obj_wriggle.x, obj_wriggle.y );
			}
			if ( obj_wriggle.hyper_tier > HYPER_TIER_1 ) {
				exy = instance_create_layer( x, y, "enemy", _bullet );
				with (exy) {
					speed = _speed;
					friction = -.02 * obj_wriggle.hyper_tier;
					direction = point_direction( x, y, obj_wriggle.x, obj_wriggle.y ) + 20;
				}
				exy = instance_create_layer( x, y, "enemy", _bullet );
				with (exy) {
					speed = _speed;
					friction = -.02 * obj_wriggle.hyper_tier;
					direction = point_direction( x, y, obj_wriggle.x, obj_wriggle.y ) - 20;
				}
			}
			break;
		case PATTERN_AIMED_WAVE:
			audio_play_sound( snd_enemy_bullet, 1, false );
			for ( var i = 0; i < 5 + (obj_wriggle.hyper_tier * 2); i++ ) {
				exy = instance_create_layer( x, y, "enemy", _bullet );
				with (exy) {
					speed = _speed;
					friction = -.02 * obj_wriggle.hyper_tier;
					direction = point_direction( x, y, obj_wriggle.x, obj_wriggle.y ) 
					- (30 + 10 * obj_wriggle.hyper_tier) + ( i * (50 + 10 * obj_wriggle.hyper_tier) / (5 + obj_wriggle.hyper_tier * 2) );
				}
			}
			break;
		case PATTERN_SHOTGUN:
			audio_play_sound( snd_enemy_bullet, 1, false );
			for ( var i = 0; i < 3 + (obj_wriggle.hyper_tier * 2); i++ ) {
				exy = instance_create_layer( x, y, "enemy", _bullet );
				with (exy) {
					speed = _speed - 1;
					friction = -.02 * obj_wriggle.hyper_tier;
					direction = point_direction( x, y, obj_wriggle.x, obj_wriggle.y ) 
					- (10 + 10 * obj_wriggle.hyper_tier) + ( i * (20 + 10 * obj_wriggle.hyper_tier) / (5 + obj_wriggle.hyper_tier * 2) );
				}
			}
			for ( var i = 0; i < 3 + (obj_wriggle.hyper_tier * 2); i++ ) {
				exy = instance_create_layer( x, y, "enemy", _bullet );
				with (exy) {
					speed = _speed - .5;
					friction = -.02 * obj_wriggle.hyper_tier;
					direction = point_direction( x, y, obj_wriggle.x, obj_wriggle.y ) 
					- (10 + 10 * obj_wriggle.hyper_tier) + ( i * (20 + 10 * obj_wriggle.hyper_tier) / (2 + obj_wriggle.hyper_tier * 2) );
				}
			}
			for ( var i = 0; i < 3 + (obj_wriggle.hyper_tier * 2); i++ ) {
				exy = instance_create_layer( x, y, "enemy", _bullet );
				with (exy) {
					speed = _speed;
					friction = -.02 * obj_wriggle.hyper_tier;
					direction = point_direction( x, y, obj_wriggle.x, obj_wriggle.y ) 
					- (10 + 10 * obj_wriggle.hyper_tier) + ( i * (20 + 10 * obj_wriggle.hyper_tier) / (2 + obj_wriggle.hyper_tier * 2) );
				}
			}
			break;
		case PATTERN_LANE:
			audio_play_sound( snd_enemy_bullet, 1, false );
			for ( var i = 0; i < 5 + (obj_wriggle.hyper_tier * 2); i++ ) {
				exy = instance_create_layer( x, y, "enemy", _bullet );
				with (exy) {
					speed = _speed - (i / 2);
					friction = -.02 * obj_wriggle.hyper_tier;
					direction = point_direction( x, y, obj_wriggle.x, obj_wriggle.y );
				}
			}
			break;
		case PATTERN_RANDOM_BURST:
			audio_play_sound( snd_enemy_bullet, 1, false );
			for ( var i = 0; i < 6 + (obj_wriggle.hyper_tier * 3); i++ ) {
				exy = instance_create_layer( x, y, "enemy", _bullet );
				with (exy) {
					speed = _speed + random(2);
					friction = -.02 * obj_wriggle.hyper_tier;
					direction = irandom(360);
				}
			}
			break;
		case PATTERN_RING:
			audio_play_sound( snd_enemy_bullet, 1, false );
			for ( var i = 0; i < 12 + (obj_wriggle.hyper_tier * 6); i++ ) {
				exy = instance_create_layer( x, y, "enemy", _bullet );
				with (exy) {
					speed = _speed;
					friction = -.02 * obj_wriggle.hyper_tier;
					direction = i * (360 / (12 + obj_wriggle.hyper_tier * 6)); 
				}
			}
			break;
		default:
			break;
	}
}