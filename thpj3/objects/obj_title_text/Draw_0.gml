draw_set_font(fn_title_text);
draw_set_halign(fa_left);

draw_set_color(c_black);
draw_set_alpha(.25 + (.75 * abs(dsin(alpha_cycle))));
draw_text(x - 1, y - 1, "Press the any key to continue. . .");
draw_text(x + 1, y + 1, "Press the any key to continue. . .");
draw_text(x - 1, y + 1, "Press the any key to continue. . .");
draw_text(x + 1, y - 1, "Press the any key to continue. . .");
draw_set_color(c_white);
draw_set_alpha(1);

draw_set_font(fn_dialogue_names);
draw_set_color(c_black);
draw_text( 900 - 1, 690 - 1, "High: " );
draw_text( 900 + 1, 690 - 1, "High: " );
draw_text( 900 - 1, 690 + 1, "High: " );
draw_text( 900 + 1, 690 + 1, "High: " );
draw_set_halign(fa_right);
draw_text( 1260 - 1, 690 - 1, hiscore );
draw_text( 1260 + 1, 690 - 1, hiscore );
draw_text( 1260 - 1, 690 + 1, hiscore );
draw_text( 1260 + 1, 690 + 1, hiscore );
draw_set_halign(fa_left);
draw_set_color(c_white);
draw_text( 900, 690, "High: " );
draw_set_halign(fa_right);
draw_text( 1260, 690, hiscore );
draw_set_halign(fa_left);

draw_set_font(fn_title_text);
draw_text_color(x,y,"Press the any key to continue. . .", c_aqua, c_yellow, c_lime, c_fuchsia, .25 + (.75 * abs(dsin(alpha_cycle))) );
