if (dialogue_mode) {
	
//TODO: Draw left active character, transparent if "last active"
//	draw_sprite_ext( actor_left
//TODO: Draw right active character, transparent if "last active"
//	draw_sprite_ext( actor_right
	
// Draw dialogue box
	draw_self();
	
//TODO: Draw current active character's name
	if ( last_active == 0 ) {
		draw_text( 128, 640, actor_left );
		
	}
	if ( last_active == 1 ) {
		draw_set_halign( fa_right );
		draw_text( 1080, 640, actor_right );
		draw_set_halign( fa_left );
	}

//TODO: Draw current active character's text, adding one character at a time
	draw_text( 128, 480, textspew );
	
//TODO: If the current text has reached completion, draw an arrow in the corner
	if (text_advance_ready == 1) {
		loopdoop++;
		draw_sprite( spr_text_arrow, round((loopdoop % 160) / 20), 1088, 608 ); 
	}

}