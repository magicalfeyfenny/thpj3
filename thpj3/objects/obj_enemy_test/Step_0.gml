// Inherit the parent event
event_inherited();

pattern_delay -= (1 + obj_wriggle.hyper_tier);

if ( pattern_delay <= 0 ) {
	scr_pattern_fire( PATTERN_AIMED_WAVE, 5, obj_bullet_test );
	pattern_delay = pattern_delay_target;
}