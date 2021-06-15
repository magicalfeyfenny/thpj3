/// @function:									scr_pattern_fire( _pattern, _speed, _bullet );
/// @param _pattern	{real}
/// @param _speed	{real}
/// @param _bullet	{object}


function scr_pattern_fire( _pattern, _speed, _bullet ) {
	switch ( _pattern ) {
		case PATTERN_STREAM: {
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
		}
		case PATTERN_AIMED_WAVE: {
			audio_play_sound( snd_enemy_bullet, 1, false );
			for ( var i = 0; i < 5 + (obj_wriggle.hyper_tier * 2); i++ ) {
				exy = instance_create_layer( x, y, "enemy", _bullet );
				with (exy) {
					speed = _speed;
					friction = -.02 * obj_wriggle.hyper_tier;
					direction = point_direction( x, y, obj_wriggle.x, obj_wriggle.y ) 
					- (25 + 10 * obj_wriggle.hyper_tier) + ( i * (50 + 10 * obj_wriggle.hyper_tier) / (5 + obj_wriggle.hyper_tier * 2) );
				}
			}
			break;
		}
		case PATTERN_SHOTGUN: {
			audio_play_sound( snd_enemy_bullet, 1, false );
			for ( var i = 0; i < 3 + (obj_wriggle.hyper_tier * 2); i++ ) {
				exy = instance_create_layer( x, y, "enemy", _bullet );
				with (exy) {
					speed = _speed - 1;
					friction = -.02 * obj_wriggle.hyper_tier;
					direction = point_direction( x, y, obj_wriggle.x, obj_wriggle.y ) 
					- (10 + 10 * obj_wriggle.hyper_tier) + ( i * (20 + 10 * obj_wriggle.hyper_tier) / (2 + obj_wriggle.hyper_tier * 2) );
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
		}
		case PATTERN_LANE: {
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
		}
		case PATTERN_RANDOM_BURST: {
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
		}
		case PATTERN_RING: {
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
		}
		case PATTERN_RANDOM_RING: {
			audio_play_sound( snd_enemy_bullet, 1, false );
			var j = random(4);
			for ( var i = 0; i < 24 + (obj_wriggle.hyper_tier * 3); i++ ) {
				exy = instance_create_layer( x - 50 + random(100), y - 200 + random(400), "enemy", _bullet );
				with (exy) {
					speed = _speed;
					friction = -.02 * obj_wriggle.hyper_tier;
					direction = i * (360 / (24 + obj_wriggle.hyper_tier * 3)) + j; 
				}
			}
			break;
		}
		case PATTERN_HORIZ_WALL: {
			audio_play_sound( snd_enemy_bullet, 1, false );
			var j = random(10);
			for ( var i = 0; i < 7 + (obj_wriggle.hyper_tier * 2); i++ ) {
				exy = instance_create_layer( 1280, 120 + i * (600 / (5 + obj_wriggle.hyper_tier)) + j, "enemy", _bullet );
				with (exy) {
					speed = _speed;
					friction = -.02 * obj_wriggle.hyper_tier;
					direction = 180; 
				}
			}
			break;
		}
		case PATTERN_VERT_WALL: {
			audio_play_sound( snd_enemy_bullet, 1, false );
			var j = random(10);
			for ( var i = 0; i < 10 + (obj_wriggle.hyper_tier * 2); i++ ) {
				exy = instance_create_layer( 20 + i * (1250 / (5 + obj_wriggle.hyper_tier * 2)) + j, 20, "enemy", _bullet );
				with (exy) {
					speed = _speed;
					friction = -.02 * obj_wriggle.hyper_tier;
					direction = 270; 
				}
			}
			break;
		}
		case PATTERN_RANDOM_SPRAY: {
			audio_play_sound( snd_enemy_bullet, 1, false );
			for ( var i = 0; i < 6 + (obj_wriggle.hyper_tier * 3); i++ ) {
				exy = instance_create_layer( x, y, "enemy", _bullet );
				with (exy) {
					speed = _speed + random(2);
					friction = -.02 * obj_wriggle.hyper_tier;
					direction = 100 + random(160);
				}
			}
			break;
		}
		case PATTERN_LANE_RING: {
			audio_play_sound( snd_enemy_bullet, 1, false );
			var k = random(8);
			for ( var j = 0; j < 20 + (obj_wriggle.hyper_tier * 3); j++ ) {
				for ( var i = 0; i < 5 + (obj_wriggle.hyper_tier * 2); i++ ) {
					exy = instance_create_layer( x, y, "enemy", _bullet );
					with (exy) {
						speed = _speed - (i / 2);
						friction = -.02 * obj_wriggle.hyper_tier;
						direction = point_direction( x, y, obj_wriggle.x, obj_wriggle.y ) + j * (360 / ( 20 + obj_wriggle.hyper_tier * 3)) + k;
					}
				}
			}
		break;
		}
		case PATTERN_SHOTGUN_RING: {
			audio_play_sound( snd_enemy_bullet, 1, false );
			var k = random(6);
			for ( var j = 0; j < 6 + (obj_wriggle.hyper_tier); j++ ) {
				for ( var i = 0; i < 3 + (obj_wriggle.hyper_tier * 2); i++ ) {
					exy = instance_create_layer( x, y, "enemy", _bullet );
					with (exy) {
						speed = _speed - 1;
						friction = -.02 * obj_wriggle.hyper_tier;
						direction = point_direction( x, y, obj_wriggle.x, obj_wriggle.y ) 
						- (10 + 10 * obj_wriggle.hyper_tier) + ( i * (20 + 10 * obj_wriggle.hyper_tier) / (2 + obj_wriggle.hyper_tier * 2) ) 
						+ j * (360 / (6 + obj_wriggle.hyper_tier) ) + k;
					}
				}
				for ( var i = 0; i < 3 + (obj_wriggle.hyper_tier * 2); i++ ) {
					exy = instance_create_layer( x, y, "enemy", _bullet );
					with (exy) {
						speed = _speed - .5;
						friction = -.02 * obj_wriggle.hyper_tier;
						direction = point_direction( x, y, obj_wriggle.x, obj_wriggle.y ) 
						- (10 + 10 * obj_wriggle.hyper_tier) + ( i * (20 + 10 * obj_wriggle.hyper_tier) / (2 + obj_wriggle.hyper_tier * 2) )
						+ j * (360 / (6 + obj_wriggle.hyper_tier) ) + k;
					}
				}
				for ( var i = 0; i < 3 + (obj_wriggle.hyper_tier * 2); i++ ) {
					exy = instance_create_layer( x, y, "enemy", _bullet );
					with (exy) {
						speed = _speed;
						friction = -.02 * obj_wriggle.hyper_tier;
						direction = point_direction( x, y, obj_wriggle.x, obj_wriggle.y ) 
						- (10 + 10 * obj_wriggle.hyper_tier) + ( i * (20 + 10 * obj_wriggle.hyper_tier) / (2 + obj_wriggle.hyper_tier * 2) )
						+ j * (360 / (6 + obj_wriggle.hyper_tier) ) + k;
					}
				}
			}
			break;
		}
		case PATTERN_STREAM_RING: {
			var _x = x;
			var _y = y;
			audio_play_sound( snd_enemy_bullet, 1, false );
			for ( var i = 0; i < 15 + (obj_wriggle.hyper_tier * 5); i++ ) {
				exy = instance_create_layer( x + (lengthdir_x(150, i * (360 / (15 + obj_wriggle.hyper_tier * 5 )))), 
											y + (lengthdir_y(150, i * (360 / (15 + obj_wriggle.hyper_tier * 5 )))), "enemy", _bullet );
				with (exy) {
					speed = _speed;
					friction = -.02 * obj_wriggle.hyper_tier;
					direction = point_direction( _x, _y, obj_wriggle.x, obj_wriggle.y );
				}
			}
			break;
		}
		default: {
			break;
		}
	}
}