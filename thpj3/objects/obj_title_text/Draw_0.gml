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

draw_text_color(x,y,"Press the any key to continue. . .", c_aqua, c_yellow, c_lime, c_fuchsia, .25 + (.75 * abs(dsin(alpha_cycle))) );
