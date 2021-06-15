if (image_xscale != 1) {
	gpu_set_blendmode(bm_add);
	draw_self();
	gpu_set_blendmode(bm_normal);
} else {
	gpu_set_blendmode(bm_max);
	draw_self();
	gpu_set_blendmode(bm_normal);
}