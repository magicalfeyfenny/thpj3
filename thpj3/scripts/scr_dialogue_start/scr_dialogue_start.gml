/// @function:							scr_dialogue_start( _filename );
/// @param	{string}	_filename		The filename of the dialogue branch

// Requirements: An instance of obj_dialogue

function scr_dialogue_start( _filename ) {
	if (!instance_exists(obj_dialogue) ) {
		return -1;
	}
		
//file format for dialogue:
/*
	last_active			{int}		active_test
	actor_left_emote	{int}		emote_test
	actor_left			{string}	name_test
	actor_right_emote	{int}		emote_test
	actor_right			{string}	name_test
	texttarget			{string}	text_test
	
	repeat until EOF. # acts as a newline delimiter
*/	

	//clear all queues
	ds_queue_clear( obj_dialogue.active_test );
	ds_queue_clear( obj_dialogue.emote_test );
	ds_queue_clear( obj_dialogue.name_test );
	ds_queue_clear( obj_dialogue.text_test );

	//open dialogue file matching _filename
	file = file_text_open_read( _filename );

	//enqueue dialogue
	while (!file_text_eof(file) ) {
		ds_queue_enqueue( obj_dialogue.active_test, file_text_read_real(file) );
		file_text_readln(file);
		ds_queue_enqueue( obj_dialogue.emote_test, file_text_read_real(file) );
		file_text_readln(file);
		ds_queue_enqueue( obj_dialogue.name_test, file_text_read_string(file) );
		file_text_readln(file);
		ds_queue_enqueue( obj_dialogue.emote_test, file_text_read_real(file) );
		file_text_readln(file);
		ds_queue_enqueue( obj_dialogue.name_test, file_text_read_string(file) );
		file_text_readln(file);
		ds_queue_enqueue( obj_dialogue.text_test, file_text_read_string(file) );
		file_text_readln(file);
	}
	
	//close dialogue file
	file_text_close( file );
		
	//enter dialogue mode and set variables
	obj_dialogue.dialogue_mode = true;
	obj_dialogue.textspew = "";
	obj_dialogue.texttarget = "";
	obj_dialogue.textload = "";
	obj_dialogue.actor_left = "";
	obj_dialogue.actor_left_emote = EMOTE_NEUTRAL;
	obj_dialogue.actor_right = "";
	obj_dialogue.actor_right_emote = EMOTE_NEUTRAL;
	obj_dialogue.spewlength = 0;
	obj_dialogue.last_active = LEFT;
	obj_dialogue.text_advance_ready = TEXT_LOADING;
}