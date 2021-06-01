if (counter <= 100) {
	counter++;
	y++;
}
if (counter == 100) {
	if (text_created == 0) {
		instance_create_layer(300, 600, "title", obj_title_text);
		text_created = 1;
	}
}

image_alpha = counter / 100;