dialogue_flag = 0;
dialogue_mode = true;
loopdoop = 0;

textspew = "";
texttarget = "";
actor_left = "";
actor_right = "";
spewlength = 0;
last_active = 0;
text_advance_ready = -1;

name_test = ds_queue_create();
text_test = ds_queue_create();
active_test = ds_queue_create();

if (dialogue_flag == 0) {
	ds_queue_enqueue(name_test, 
			"", "",
			"Wriggle", "Mystia",
			"Wriggle", "Mystia",
			"Wriggle", "Mystia",
			"Wriggle", "Mystia",
			"Wriggle", "Mystia"
		);
	ds_queue_enqueue(text_test,
			"",
			"So, what are you up to?",
			"on this fine day of Tuesday",
			"not much my good binch",
			"just drinking my soup",
			"cool cool"
		);
	ds_queue_enqueue(active_test,
			0,
			0,
			0,
			1,
			1,
			0
		);
	dialogue_flag++;
}