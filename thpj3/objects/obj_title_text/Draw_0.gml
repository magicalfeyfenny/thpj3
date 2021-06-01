draw_set_font(fn_title_text);
draw_set_halign(fa_left);

alpha_cycle++;

draw_text_color(x,y,"Press the any key to continue. . .", c_aqua, c_yellow, c_lime, c_fuchsia, .25 + (.75 * abs(dsin(alpha_cycle))) );
