if (dialogue_mode) {
	if (text_advance_ready == -1 && !ds_queue_empty(name_test) && !ds_queue_empty(name_test) && !ds_queue_empty(active_test)) {
		text_advance_ready = 0;
		actor_left = ds_queue_dequeue(name_test);
		actor_right = "";
		if (!ds_queue_empty(name_test)) {
			actor_right = ds_queue_dequeue(name_test);
		}
		texttarget = ds_queue_dequeue(text_test);
		textspew = "";
		spewlength = 1;
		last_active = ds_queue_dequeue(active_test);
	} 
	
	if (text_advance_ready == 0 ) {
		textspew += string_char_at(texttarget, spewlength);
		spewlength++;
		if (keyboard_check_pressed( ord("Z") ) ) {
			textspew = texttarget;
			keyboard_clear(ord("Z"));
		}
		if (textspew == texttarget) {
			text_advance_ready = 1;
		}
	}
	
	if (text_advance_ready == 1) {
		if (keyboard_check_pressed( ord("Z") ) ) {
			text_advance_ready = -1;
			if (ds_queue_empty(name_test) || ds_queue_empty(text_test) || ds_queue_empty(active_test)) {
				dialogue_mode = false;
			}
		}
	}
	
	
	
	
	
	
	
}