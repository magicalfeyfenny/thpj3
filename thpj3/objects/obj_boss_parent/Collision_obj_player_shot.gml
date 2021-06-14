if (!invuln) {
	hp -= other.damage;
}
obj_wriggle.hyper_current += .01;
if ( point_distance(x, y, obj_wriggle.x, obj_wriggle.y) < 192 ) {
	obj_wriggle.hyper_current += .03;
}
if (hp < 60) {
	audio_play_sound( snd_enemy_hit_deep, 0, false );
} else {
	audio_play_sound( snd_enemy_hit, 0, false );
}

with (other) {
	instance_destroy();
}