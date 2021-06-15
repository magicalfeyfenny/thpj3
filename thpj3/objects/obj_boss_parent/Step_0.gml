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
		charge_timer++
		//stop shooting
	} else if ( !obj_wriggle.emergency ) {
		y += (( abs(charge_timer) % 60 ) - 30 ) / 30;
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