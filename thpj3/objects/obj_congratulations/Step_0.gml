image_turner--;

if ( image_turner > 0 ) {
	image_angle += 18;
	image_xscale = 1 / image_turner;
	image_yscale = 1 / image_turner;
} else {
	image_speed = 2;
}