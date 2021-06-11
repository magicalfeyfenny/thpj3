charge_timer--;

if (hp <= 0) {
	if ( current_phase < phases ) {
		current_phase++;
		hp = phase_hp[current_phase];
		charge_timer = BOSS_CHARGE_TIME;
		phase_mode = MODE_CHARGE;
	} else {
		instance_destroy();
	}
}

if ( phase_mode == MODE_ACTIVE ) {
	invuln = false;

	if ( obj_wriggle.emergency && !temp_speed ) {
		temp_speed = speed;
		speed = 0;
	} else if ( !obj_wriggle.emergency && temp_speed ) {
		speed = temp_speed;
		temp_speed = 0;
	}
}

if ( phase_mode == MODE_CHARGE ) {
	invuln = true;
	if ( !charge_timer ) {
		phase_mode = MODE_ACTIVE;
	}
}

if ( phase_mode == MODE_CHAT ) {
	invuln = true;
	if ( !obj_dialogue.dialogue_mode ) {
		charge_timer = BOSS_CHARGE_TIME;
		phase_mode = MODE_CHARGE;
	}
}

if ( phase_mode == MODE_APPROACH ) {
	invuln = true;
	hspeed = (10 - min( 10, BOSS_APPROACH_TIME - charge_timer ) ) * face_dir;
	vspeed = 10 - min( 10, BOSS_APPROACH_TIME - charge_timer );
	if ( !charge_timer ) {
		if ( file_exists( "stage1_midboss_chat.txt" ) ) {
			scr_dialogue_start( "stage1_midboss_chat.txt" );
			phase_mode = MODE_CHAT;
		} else {
			charge_timer = BOSS_CHARGE_TIME;
			phase_mode = MODE_CHARGE;
		}
	}
}