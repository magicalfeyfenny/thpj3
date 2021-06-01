if (counter <= 120) {
	counter++;
	y--;
}
if (counter == 120) {
	if (title_created == 0) {
		instance_create_layer(200, 0, "title", obj_title_title);
		title_created = 1;
	}
}

image_alpha = counter / 100;