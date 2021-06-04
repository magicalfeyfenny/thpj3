dialogue_mode = false;

textspew = "";
texttarget = "";
actor_left = "";
actor_left_emote = 0;
actor_right = "";
actor_right_emote = 0;
spewlength = 0;
last_active = 0;
text_advance_ready = -1;

name_test = ds_queue_create();
text_test = ds_queue_create();
active_test = ds_queue_create();
emote_test = ds_queue_create();

loopdoop = 0;

//ds_queue_enqueue(name_test, 
//		"", "",
//		"Wriggle", "Mystia",
//		"Wriggle", "Mystia",
//		"Wriggle", "Mystia",
//		"Wriggle", "Mystia",
//		"Wriggle", "Mystia"
//	);
//ds_queue_enqueue(text_test,
//		"",
//		"So, what are you up to?",
//		"on this fine day of Tuesday",
//		"not much my good binch",
//		"just drinking my soup",
//		"cool cool"
//	);
//ds_queue_enqueue(active_test,
//		0,
//		0,
//		0,
//		1,
//		1,
//		0
//	);
//	
//ds_queue_enqueue(emote_test,
//		3, 2,
//		3, 2,
//		1, 2,
//		1, 2,
//		1, 2,
//		1, 5
//	);

scr_dialogue_start( "dialogue_test.txt" );