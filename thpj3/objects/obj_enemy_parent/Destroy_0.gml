effect_create_below( ef_ellipse, x, y, 1, c_teal );
effect_create_below( ef_smoke, x, y, 0, c_silver );
audio_play_sound( snd_enemy_destroy, 0, false );
obj_wriggle.hyper_current += 2;