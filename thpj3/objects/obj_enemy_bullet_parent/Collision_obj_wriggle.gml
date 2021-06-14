if (!other.invuln) {
	with (other) {
		emergency = DEATHBOMB_WINDOW;
	}
	audio_play_sound(snd_player_pchuuun, 20, false);
}
instance_destroy();