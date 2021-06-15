/// @function					scr_scores( _mode);
/// @param	{real}	_mode

function scr_scores( _mode ) {
	switch ( _mode ) {
		case SCORE_READ:
			if ( file_exists( "scores.txt" ) ) {
				var file = file_text_open_read( "scores.txt" );
				var hiscore = 0;
				var readscore = 0;
				while ( !file_text_eof(file) ) {
					readscore = file_text_read_real( file );
					if ( hiscore < readscore ) {
						hiscore = readscore;
					}
					file_text_readln(file);
				}
			}
			return hiscore;
		case SCORE_WRITE:
			if ( file_exists( "scores.txt" ) ) {
				var file = file_text_open_append( "scores.txt" );
				file_text_write_real( file, obj_wriggle.score_current );
				file_text_writeln(file);
				file_text_close(file);
			}
			return 0;
		case SCORE_INIT:
			if ( !file_exists( "scores.txt" ) ) {
				var file = file_text_open_write( "scores.txt" );
				file_text_write_real( file, 0 );
				file_text_writeln(file);
				file_text_close(file);
			}
			return 0;
		default:
			return -1;
	}
}