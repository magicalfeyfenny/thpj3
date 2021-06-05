dialogue_mode = false;

textspew = "";
texttarget = "";
spewlength = 0;
actor_left = "";
actor_left_emote = EMOTE_NEUTRAL;
actor_right = "";
actor_right_emote = EMOTE_NEUTRAL;
last_active = LEFT;
text_advance_ready = TEXT_LOADING;

name_test = ds_queue_create();
text_test = ds_queue_create();
active_test = ds_queue_create();
emote_test = ds_queue_create();

loopdoop = 0;