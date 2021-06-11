if (obj_wriggle.hyper_time) {
	color_target = 120;
} else if (obj_wriggle.bombing) {
	color_target = 30;
} else {
	color_target = 70;
}

if ( color_current < color_target ) {
	color_current++;
} else if ( color_current > color_target ) {
	color_current--;
}