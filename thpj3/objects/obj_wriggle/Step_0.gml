hitbox_rotator++;
bombing--;
recovery--;
respawn--;
emergency--;
shoot_delay--;
h_move = 0;
v_move = 0;
if (!obj_dialogue.dialogue_mode) {
	hyper_current += .02;
	hyper_time--;
}

input_up = keyboard_check( vk_up );
input_down = keyboard_check( vk_down );
input_left = keyboard_check( vk_left );
input_right = keyboard_check( vk_right );
input_shot_left = keyboard_check( ord( "Z" ) );
input_shot_right = keyboard_check( ord( "C" ) );
input_focus = keyboard_check( vk_shift );
input_bomb = keyboard_check_pressed( ord("X") );

//limiters and resets
if ( hyper_time <= 0 ) {
	hyper_tier = HYPER_INACTIVE;
}
if ( lives_current > LIVES_MAX ) {
	lives_current = LIVES_MAX;
}
if ( bombs_current > BOMBS_MAX ) {
	bombs_current = BOMBS_MAX;
}
if ( hyper_current > HYPER_MAX ) {
	hyper_current = HYPER_MAX;
}
if ( emergency == 0 ) {
	lives_current -= 1;
	effect_create_below( ef_ring, x, y, 2, c_aqua );
	for ( var i = 0; i < 20; i++ ) {
		effect_create_below( ef_firework, x, y, 2, make_color_rgb( irandom(255), irandom(255), irandom(255) ) );
	}
	bombs_current = BOMBS_INIT;
	hyper_current += HYPER_COST;
	hyper_time = 0;
	bombing = 0;
	respawn = RESPAWN_TIMER;
	x = SPAWN_X;
	y = SPAWN_Y;
}
if ( respawn == 0 ) {
	recovery = RESPAWN_INVULN;
}

//invuln logic
if ( bombing || recovery || emergency || respawn || obj_dialogue.dialogue_mode ) {
	invuln = true;
} else {
	invuln = false;
}

//bomb logic
if ( input_bomb && !bombing && !recovery && !respawn && !obj_dialogue.dialogue_mode ) {
	//death bomb	
	if ( emergency ) {
		if ( hyper_current >= HYPER_COST && hyper_tier == HYPER_INACTIVE ) {
			hyper_current -= hyper_current;			//costs all hyper gauges, tier = maximum
			bombing = 60;
			invuln = 60;
			hyper_time = 420;
			hyper_tier = HYPER_TIER_3;
			emergency = -5;
//TODO: create hyper activation effect
			audio_play_sound(snd_player_hyperactive, 3, false);
		} else if (bombs_current > 0 ) {
			bombs_current = 0;						//costs all bombs
			bombing = 300;
			invuln = 360;
			emergency = -5;
			if (hyper_time > 0) {
				hyper_time = 0;
			}
			instance_create_layer( 0, 0, "player", obj_bomber_topologic );
			audio_play_sound(snd_player_deathbomb, 3, false);
		}
	} else {
		if ( hyper_current >= HYPER_COST && hyper_tier == HYPER_INACTIVE ) {
			hyper_time = 240;
			while ( hyper_current >= HYPER_COST ) {	//costs all filled hyper gauges, tier = expended gauges
				hyper_current -= HYPER_COST;
				hyper_time += 60;
				hyper_tier += 1;
			}
			bombing = 60;
			invuln = 60;
//TODO: create hyper activation effect
			audio_play_sound(snd_player_hyperactive, 3, false);
		} else if ( bombs_current > 0 ) {
			bombs_current -= 1;						//costs 1 bomb
			bombing = 180;
			invuln = 180;
			if (hyper_time > 0) {
				hyper_time = 0;
			}
			instance_create_layer( x, y, "player", obj_bomber );
			audio_play_sound(snd_player_bomber, 3, false);
		}
	}
}
	
//movement logic
if ( !emergency && !respawn ) {
	//convert input bools to directions
	if ( input_up ) {
		v_move--;
	}
	if ( input_down ) {
		v_move++;
	}
	if ( input_left ) {
		h_move--;
	}
	if ( input_right ) {
		h_move++;
	}
	//move
	if ( h_move != 0 || v_move != 0 ) {
		if ( input_focus ) {
			x += lengthdir_x( FOCUS_SPEED, point_direction(0, 0, h_move, v_move) );
			y += lengthdir_y( FOCUS_SPEED, point_direction(0, 0, h_move, v_move) );
		} else {
			x += lengthdir_x( UNFOC_SPEED, point_direction(0, 0, h_move, v_move) );
			y += lengthdir_y( UNFOC_SPEED, point_direction(0, 0, h_move, v_move) );
		}
	}
	//enforce screen border
	if ( x > BOUNDARY_RIGHT ) {
		x = BOUNDARY_RIGHT;
	}
	if ( x < BOUNDARY_LEFT ) {
		x = BOUNDARY_LEFT;
	}
	if ( y > BOUNDARY_BOTTOM ) {
		y = BOUNDARY_BOTTOM;
	}
	if ( y < BOUNDARY_TOP ) {
		y = BOUNDARY_TOP;
	}
}

//shot and facing logic
if ( !emergency && !respawn && !obj_dialogue.dialogue_mode ) {
	//allows changing direction if only one is held
	if ( input_shot_left && !input_shot_right ) {
		face_dir = RIGHT;		
	}
	if ( !input_shot_left && input_shot_right ) {
		face_dir = RIGHT; //i really don't feel like designing around the direction-switching gimmick
	}
	if ( input_shot_left || input_shot_right ) {
		if ( shoot_delay <= 0 ) {
			shoot_delay = SHOT_DELAY;
			if (hyper_time) {
				audio_play_sound(snd_player_hypershot, 0, false);
			} else {
				audio_play_sound(snd_player_shot, 0, false);
			}
			var shooty = instance_create_layer( x + (face_dir * 10), y + (TOP * 10), "player", obj_player_shot);
			with (shooty) {
				face_dir = other.face_dir;
				damage = SHOT_PLAYER_DAMAGE * (1 + .5 * other.hyper_tier);
				speed = SHOT_PLAYER_SPEED;
				direction = 270 + (90 * face_dir);
				image_angle = direction;
				if (other.hyper_time) {
					image_xscale = 1 + (.3 * other.hyper_tier);
					image_yscale = 1 + (.3 * other.hyper_tier);
				}
			}
			var shooty = instance_create_layer( x + (face_dir * 10), y + (BOTTOM * 10), "player", obj_player_shot);
			with (shooty) {
				face_dir = other.face_dir;
				damage = SHOT_PLAYER_DAMAGE * (1 + .5 * other.hyper_tier);
				speed = SHOT_PLAYER_SPEED;
				direction = 270 + (90 * face_dir);
				image_angle = direction;
				if (other.hyper_time) {
					image_xscale = 1 + (.3 * other.hyper_tier);
					image_yscale = 1 + (.3 * other.hyper_tier);
				}
			}
			for (var i = 0; i < 40; i += 10) {
				var shotia = instance_create_layer( top_option.x, top_option.y, "player", obj_option_shot);
				with (shotia) {
					face_dir = other.face_dir;
					damage = SHOT_OPTION_DAMAGE * (1 + .5 * other.hyper_tier);
					speed = SHOT_OPTION_SPEED;
					direction = point_direction( other.x, other.y, other.top_option.x, other.top_option.y ) - (i * face_dir);
					image_angle = direction;
					if (other.hyper_time) {
						image_xscale = 1 + (.3 * other.hyper_tier);
						image_yscale = 1 + (.3 * other.hyper_tier);
					}
				}
				var shotia = instance_create_layer( bottom_option.x, bottom_option.y, "player", obj_option_shot);
				with (shotia) {
					face_dir = other.face_dir;
					damage = SHOT_OPTION_DAMAGE * (1 + .5 * other.hyper_tier);
					speed = SHOT_OPTION_SPEED;
					direction = point_direction( other.x, other.y, other.bottom_option.x, other.bottom_option.y ) + (i * face_dir);
					image_angle = direction;
					if (other.hyper_time) {
						image_xscale = 1 + (.3 * other.hyper_tier);
						image_yscale = 1 + (.3 * other.hyper_tier);
					}
				}
			}
		}
	}
}
	
//death logic
if ( lives_current == 0 ) {
//TODO: add score and continue logic
	audio_stop_all();
	room_goto(rm_title);
}



if (keyboard_check( vk_escape ) ) {
	game_end();
}