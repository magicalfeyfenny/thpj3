effect_create_below( ef_ellipse, x, y, 1, c_teal );
effect_create_below( ef_smoke, x, y, 0, c_silver );
audio_play_sound( snd_enemy_destroy, 0, false );
obj_wriggle.hyper_current += 2;
if ( !obj_wriggle.bombing ) {
	obj_wriggle.score_multiply += 100 + (20 * (obj_wriggle.hyper_tier));
}
obj_wriggle.score_current += SCORE_ENEMY_VALUE * ( obj_wriggle.score_multiply ) * (obj_wriggle.hyper_tier + 1);