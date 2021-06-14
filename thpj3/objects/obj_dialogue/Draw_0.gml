if (dialogue_mode) {
	
	if ( actor_left_sprite != -1 ) {
		draw_sprite_ext( actor_left_sprite, 0, 180, window_get_height(), 1, 1, 0, c_white, 1 - (.5 * last_active));
	}
	if ( actor_right_sprite != -1 ) {
		draw_sprite_ext( actor_right_sprite, 0, window_get_width() - 180, window_get_height(), -1, 1, 0, c_white, .5 + (.5 * last_active));
	}

// Draw dialogue box
	draw_self();
	
	draw_set_font(fn_dialogue_names);
	draw_set_alpha(1);
	if ( last_active == LEFT_ACTOR ) {
		draw_set_alpha(0);		
	}
	draw_set_halign( fa_right );
	draw_text( 1080, 640, actor_right );
	draw_set_halign( fa_left );
	
	draw_set_alpha(1);
	if ( last_active == RIGHT_ACTOR ) {
		draw_set_alpha(0);
	}
	draw_text( 128, 640, actor_left );
	draw_set_alpha(1);
	
	draw_set_font(fn_dialogue_text);
	draw_text( 145, 490, textspew );
	
	if (text_advance_ready == TEXT_READY) {
		loopdoop++;
		draw_sprite( spr_text_arrow, round((loopdoop % 160) / 20), 1088, 608 ); 
	}

}