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
				if ( !(abs(charge_timer) % 20) ) {
					scr_pattern_fire( PATTERN_LANE_RING, 5, obj_bullet_blade );
				}
				if ( !(abs(charge_timer) % 120) ) {
					scr_pattern_fire( PATTERN_RING, 6, obj_bullet_ball );
					scr_pattern_fire( PATTERN_RING, 5, obj_bullet_ball );
				}
				break;
			}
			case 1: {
				if ( !(abs(charge_timer) % 30) ) {
					scr_pattern_fire( PATTERN_VERT_WALL, 3, obj_bullet_bead );
				}
				if ( !(abs(charge_timer) % 10) ) {
					scr_pattern_fire( PATTERN_RANDOM_SPRAY, 4, obj_bullet_pellet );
				}
				break;
			}
			case 2: {
				if ( !(abs(charge_timer) % 180) ) {
					scr_pattern_fire( PATTERN_SHOTGUN, 3, obj_bullet_blade);
				}
				if ( !(abs(charge_timer) % 20) ) {
					scr_pattern_fire( PATTERN_RANDOM_RING, 5, obj_bullet_card);
				}
				break;
			}
			case 3: {
				if ( !(abs(charge_timer) % 13) ) {
					scr_pattern_fire( PATTERN_STREAM_RING, 4, obj_bullet_blade);
				}
				if ( !(abs(charge_timer) % 40) ) {
					scr_pattern_fire( PATTERN_RANDOM_BURST, 5, obj_bullet_bead);
				}
				break;
			}
			case 4: {
				if ( !(abs(charge_timer) % 40) ) {
					scr_pattern_fire( PATTERN_SHOTGUN_RING, 4, obj_bullet_diamond );
				}
				break;
			}
			case 5: {
				if ( !(abs(charge_timer) % 20) ) {
					scr_pattern_fire( PATTERN_LANE, 4, obj_bullet_ball );
				}
				if ( !(abs(charge_timer) % 60) ) {
					scr_pattern_fire( PATTERN_LANE_RING, 3, obj_bullet_blade );
				}
				break;
			}
			case 6: {
				if ( !(abs(charge_timer) % 60) ) {
					scr_pattern_fire( PATTERN_SHOTGUN_RING, 4, obj_bullet_diamond );
				}
				if ( !((abs(charge_timer) % 30) ) ){
					scr_pattern_fire( PATTERN_LANE_RING, 5, obj_bullet_blade );
				}
				break;
			}
			case 7: {
				if ( !(abs(charge_timer) % 13) ) {
					scr_pattern_fire( irandom(12), 2 + random(4), choose(obj_bullet_ball, obj_bullet_bead, obj_bullet_blade, obj_bullet_card, obj_bullet_diamond, obj_bullet_pellet));
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
}

//dialogue
if ( phase_mode == MODE_CHAT ) {
	invuln = true;
	if ( !obj_dialogue.dialogue_mode ) {
		audio_stop_sound( snd_music_stage1 );
		audio_play_sound( snd_music_st1boss, 0, true );
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
		if ( file_exists( stagename + "_" + bossname + "_dialogue.txt" ) ) {	// "stage#_bossname_dialogue.txt"
			scr_dialogue_start( stagename + "_" + bossname + "_dialogue.txt" );
			phase_mode = MODE_CHAT;
		} else {
			charge_timer = BOSS_CHARGE_TIME;
			phase_mode = MODE_CHARGE;
		}
	}
}