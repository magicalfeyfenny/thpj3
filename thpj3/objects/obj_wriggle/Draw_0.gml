if (!respawn) {
	draw_sprite_ext( spr_wriggle, image_index, x, y, face_dir, 1, 0, c_white, 1 * ( max( 1, recovery ) % 3 ) );
}

draw_sprite_ext( spr_wriggle_hitbox, 0, x, y, 2, 2, hitbox_rotator, c_white, .75);
draw_sprite_ext( spr_wriggle_hitbox, 0, x, y, 1, 1, -hitbox_rotator, c_white, 1);

draw_set_font( fn_GUI );
draw_text( 20, 690, input_left ); 
draw_text( 50, 690, input_right );
draw_text( 35, 680, input_up );
draw_text( 35, 700, input_down );
draw_text( 70, 690, input_focus );
draw_text( 80, 690, input_shot_left );
draw_text( 90, 690, input_bomb );
draw_text( 100, 690, input_shot_right );
draw_text( 1000, 600, "bomb timer: " + string(bombing) );
draw_text( 1000, 620, "hyper timer: " + string(hyper_time) + " / " + string(hyper_tier) );
draw_text( 1000, 640, "emergency timer: " + string(emergency) );
draw_text( 1000, 660, "death recovery: " + string(recovery) + " / " + string(respawn) );
draw_text( 1000, 10, "dialogue state: " + string(obj_dialogue.dialogue_mode) );
draw_text( 1000, 30, "invulnerable state: " + string(invuln) );
draw_text( 20, 10, "lives: " + string(lives_current) + " / " + string(LIVES_MAX) );
draw_text( 20, 30, "bombs: " + string(bombs_current) + " / " + string(BOMBS_MAX) );
draw_text( 20, 50, "hyper: " + string(hyper_current) + " / " + string(HYPER_MAX) + " / req: " + string(HYPER_COST) );
