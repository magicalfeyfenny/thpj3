// Inherit the parent event
event_inherited();

pattern_delay -= (1 + obj_wriggle.hyper_tier);

if ( pattern_delay <= 0 && x > 300 ) {
	scr_pattern_fire( PATTERN_STREAM, 5, obj_bullet_blade );
	pattern_delay = pattern_delay_target;
}