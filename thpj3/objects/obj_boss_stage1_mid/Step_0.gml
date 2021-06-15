charge_timer--;

if (hp <= 0) {
	with (obj_enemy_bullet_parent) {
		instance_destroy();
	}
	if ( current_phase < phases ) {
		current_phase++;
		hp = phase_hp[current_phase];
		charge_timer = BOSS_CHARGE_TIME;
		phase_mode = MODE_CHARGE;
		audio_play_sound( snd_boss_spellbreak, 1, false );
	} else {
		instance_destroy();
	}
}

//attack patterns
if ( phase_mode == MODE_ACTIVE ) {
	invuln = false;
	
	if ( obj_wriggle.emergency ) {
		charge_timer++;
		//stop shooting
	} else if ( !obj_wriggle.emergency ) {
		y += (( abs(charge_timer) % 60 ) - 30 ) / 30;
		
		switch (current_phase) {
			case 0: {
				if ( !(abs(charge_timer) % 10) ) {
					scr_pattern_fire( PATTERN_RANDOM_RING, 3, obj_bullet_card );
				}
				if ( !(abs(charge_timer) % 15) ) {
					scr_pattern_fire( PATTERN_LANE, 6, obj_bullet_diamond );
				}
				break;
			}
			case 1: {
				if ( !(abs(charge_timer) % 20) ) {
					scr_pattern_fire( PATTERN_HORIZ_WALL, 2, obj_bullet_card );
					scr_pattern_fire( PATTERN_VERT_WALL, 2, obj_bullet_card );
				}
				if ( !(abs(charge_timer) % 120) ) {
					scr_pattern_fire( PATTERN_SHOTGUN, 4, obj_bullet_blade );
				}
				break;
			}
			case 2: {
				if ( !(abs(charge_timer) % 180) ) {
					scr_pattern_fire( PATTERN_AIMED_WAVE, 3, obj_bullet_diamond);
					scr_pattern_fire( PATTERN_AIMED_WAVE, 2, obj_bullet_diamond);
					scr_pattern_fire( PATTERN_LANE, 5, obj_bullet_ball);
				}
				break;
			}
			case 3: {
				if ( !(abs(charge_timer) % 5) ) {
					scr_pattern_fire( PATTERN_STREAM, 6, obj_bullet_card);
				}
				if ( !(abs(charge_timer) % 30) ) {
					scr_pattern_fire( PATTERN_RANDOM_BURST, 4, obj_bullet_ball);
				}
				break;
			}
			default: {
				break;
			}
		}
	}
}

//animations in-between phases
if ( phase_mode == MODE_CHARGE ) {
	invuln = true;
	if ( !charge_timer ) {
		phase_mode = MODE_ACTIVE;
	}
	y = _y;
}

//dialogue
if ( phase_mode == MODE_CHAT ) {
	invuln = true;
	if ( !obj_dialogue.dialogue_mode ) {
		charge_timer = BOSS_CHARGE_TIME;
		phase_mode = MODE_CHARGE;
	}
}

//jumping on-screen
if ( phase_mode == MODE_APPROACH ) {
	invuln = true;
	hspeed = (15 - min( 15, (BOSS_APPROACH_TIME - charge_timer) / 2 ) ) * face_dir;
	vspeed = 15 - min( 15, (BOSS_APPROACH_TIME - charge_timer) / 2 );
	image_angle += 24;
	if ( !charge_timer ) {
		_y = y;
		if ( file_exists( stagename + "_" + bossname + "_dialogue.txt" ) ) {	// "stage#_bossname_dialogue.txt"
			scr_dialogue_start( stagename + "_" + bossname + "_dialogue.txt" );
			phase_mode = MODE_CHAT;
		} else {
			charge_timer = BOSS_CHARGE_TIME;
			phase_mode = MODE_CHARGE;
		}
	}
}