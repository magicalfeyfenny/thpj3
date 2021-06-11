draw_set_color( make_color_rgb( color_current, color_current, color_current ) );
if ( obj_wriggle.emergency) {
	draw_set_color( make_color_rgb( 0, color_current, color_current ) );
}
gpu_set_blendmode( bm_subtract );
draw_rectangle(-1, -1, window_get_width() + 1, window_get_height() + 1, false);
gpu_set_blendmode( bm_normal );
draw_set_color( c_white );