effect_create_below(ef_ring, x, y, 2, c_orange);
effect_create_below(ef_ellipse, x, y, 2, c_fuchsia);
effect_create_below(ef_firework, x, y, 2, c_yellow);
effect_create_below(ef_smokeup, x, y, 2, c_silver);
audio_play_sound(snd_boss_destroy, 10, false);
obj_stage_controller.timeline_running = true;