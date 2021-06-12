invuln = true;
phase_mode = MODE_APPROACH;
face_dir = LEFT;
temp_speed = 0;
charge_timer = BOSS_APPROACH_TIME;

//these are default values and should be changed by any objects that inherit this object
phases = 3;
current_phase = 0;
phase_hp = [];
phase_hp[3] = 3000;
phase_hp[2] = 3500;
phase_hp[1] = 2500;
phase_hp[0] = 2000;
stagename = "stage1";
bossname = "midboss";
boss_title = "bossy person";
hp = phase_hp[current_phase];
//

with ( obj_enemy_bullet_parent ) {
	instance_destroy();
}
with ( obj_enemy_parent ) {
	if ( self.id != other.id ) {
		instance_destroy();
	}
}

obj_stage_controller.timeline_running = false;