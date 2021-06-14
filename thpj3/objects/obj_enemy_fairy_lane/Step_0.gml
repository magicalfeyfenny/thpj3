// Inherit the parent event
event_inherited();

pattern_delay -= (1 + obj_wriggle.hyper_tier);

if ( pattern_delay <= 0 && x > 300 ) {
	scr_pattern_fire( PATTERN_LANE, 6, obj_bullet_ball );
	pattern_delay = pattern_delay_target;
}