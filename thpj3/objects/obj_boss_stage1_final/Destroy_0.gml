effect_create_below(ef_ring, x, y, 2, c_black);
effect_create_below(ef_ellipse, x, y, 2, c_red);
effect_create_below(ef_firework, x, y, 2, c_fuchsia);
effect_create_below(ef_smokeup, x, y, 2, c_silver);
audio_play_sound(snd_boss_destroy, 10, false);
scr_dialogue_start( "stage1_afterboss_dialogue.txt" );
obj_stage_controller.timeline_running = true;
