for( var i = 0; i <  window_get_width() / 64; i++ ) {
	draw_sprite(spr_UI_backdrop, 0, i * 64, 0);
}

draw_sprite_ext(spr_UI_wriggle, 0, 0, 2, 2, 2, 0, c_white, 1);

for( var i = 1; i < obj_wriggle.lives_current; i++ ) {
	draw_sprite(spr_UI_life, 0, 210 + (50 * i), 50 + (20 * ((i-1) % 2)));
}

for( var i = 0; i < obj_wriggle.bombs_current; i++ ) {
	draw_sprite(spr_UI_bomb, 0, 650 + (50 * i), 50 + (20 * (i % 2)));
}

draw_sprite_part(spr_UI_hyper_fill, sprite_looper % 12, 0, 0, 122 * ((obj_wriggle.hyper_current % 100) / 100), 12, 910, 67 );
draw_sprite(spr_UI_hyper_bar, 0, 907, 64);
for( var i = 1; i <= (obj_wriggle.hyper_current / 100); i++) {
	draw_sprite(spr_UI_hyper, 0, 990 + (50 * i), 50 + (20 * ((i-1) % 2)));
}

draw_set_font(fn_GUI);
draw_set_color(c_black);
draw_text( 135 - 1, 18 - 1, "Lives: " );
draw_text( 525 - 1, 18 - 1, "Spell: " );
draw_text( 910 - 1, 18 - 1, "Shine: " );
draw_text( 135 - 1, 18 + 1, "Lives: " );
draw_text( 525 - 1, 18 + 1, "Spell: " );
draw_text( 910 - 1, 18 + 1, "Shine: " );
draw_text( 135 + 1, 18 - 1, "Lives: " );
draw_text( 525 + 1, 18 - 1, "Spell: " );
draw_text( 910 + 1, 18 - 1, "Shine: " );
draw_text( 135 + 1, 18 + 1, "Lives: " );
draw_text( 525 + 1, 18 + 1, "Spell: " );
draw_text( 910 + 1, 18 + 1, "Shine: " );
draw_set_color(c_white);
draw_text( 135, 18, "Lives: " );
draw_text( 525, 18, "Spell: " );
draw_text( 910, 18, "Shine: " );

if ( instance_exists(obj_boss_parent) ) {
	with( obj_boss_parent ) {
		if ( phase_mode == MODE_CHARGE || phase_mode == MODE_ACTIVE ) {
			if ( charge_timer ) {
				draw_sprite_part( spr_UI_boss_fill, 0, 0, 0, (980 * ( BOSS_CHARGE_TIME - charge_timer) / BOSS_CHARGE_TIME ), 28, 150, 676);
			} else {
				draw_sprite_part( spr_UI_boss_fill, 0, 0, 0, (980 * ( hp / phase_hp[current_phase] ) ), 28, 150, 676);
			}
			draw_sprite( spr_UI_boss_bar, 0, 640, 690 );
			draw_set_halign( fa_right );
			draw_set_color( c_black );
			draw_text( 1090 + 1, 640 - 1, bossname );
			draw_text( 1090 - 1, 640 - 1, bossname );
			draw_text( 1090 + 1, 640 + 1, bossname );
			draw_text( 1090 - 1, 640 + 1, bossname );
			draw_set_color( c_white );
			draw_text( 1090, 640, bossname );
			draw_set_halign( fa_left );
			for( var i = 0; i < (phases - current_phase); i++ ) {
				draw_sprite(spr_UI_boss_phases, 0, 1110 + (15 * i), 674 + (4 * (i % 2)));
			}
		}
	}
}
		