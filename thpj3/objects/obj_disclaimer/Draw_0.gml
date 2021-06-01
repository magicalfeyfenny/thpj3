draw_set_halign( fa_center );
draw_set_font( fn_disclaimer );



draw_text_color(640, 100, "The following is a fan-created derivative work of Touhou Project.\n"
						+ "Touhou Project is the copyright of Team Shanghai Alice.\n\n\n"
						+ "Developed for Touhou Pride Jam #3 by magicalfeyfenny\n"
						+ "6/1/2021 ~ 6/15/2021"
						, c_aqua, c_aqua, c_fuchsia, c_fuchsia, alpha_cycle);
				
				
draw_set_font( fn_contact );
draw_set_halign( fa_right );
draw_text_color( 1250, 700, "Team Shanghai Alice: https://www16.big.or.jp/~zun/", c_aqua, c_aqua, c_fuchsia, c_fuchsia, alpha_cycle);

draw_set_halign( fa_left );
draw_text_color( 30, 700, "Source code: https://git.fenny.space/magicalfeyfenny/touhou-pride-jam-2021", c_aqua, c_aqua, c_fuchsia, c_fuchsia, alpha_cycle);