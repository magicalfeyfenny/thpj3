/// @function							scr_initialize();

//define global constants
#macro TEXT_LOADING -1
#macro TEXT_TYPING 0
#macro TEXT_READY 1
#macro EMOTE_NEUTRAL 0
#macro EMOTE_HAPPY 1
#macro EMOTE_SAD 2
#macro EMOTE_CONFUSED 3
#macro EMOTE_ANGRY 4
#macro EMOTE_OUCH 5
#macro LEFT_ACTOR 0
#macro RIGHT_ACTOR 1

#macro BOUNDARY_LEFT 32
#macro BOUNDARY_RIGHT 1248
#macro BOUNDARY_TOP 32
#macro BOUNDARY_BOTTOM 688
#macro SPAWN_X 120
#macro SPAWN_Y 360

#macro LEFT -1
#macro RIGHT 1
#macro TOP -1
#macro BOTTOM 1
#macro LIVES_INIT 3
#macro LIVES_MAX 5
#macro BOMBS_INIT 3
#macro BOMBS_MAX 5
#macro HYPER_INIT 0
#macro HYPER_COST 100
#macro HYPER_MAX 300
#macro DEATHBOMB_WINDOW 15
#macro RESPAWN_TIMER 60
#macro RESPAWN_INVULN 120

#macro FOCUS_SPEED 2
#macro UNFOC_SPEED 5

#macro HYPER_INACTIVE 0
#macro HYPER_TIER_1 1
#macro HYPER_TIER_2 2
#macro HYPER_TIER_3 3

#macro OPTION_FORWARD 100
#macro OPTION_SIDE_UNFOC 100
#macro OPTION_SIDE_FOCUS 20

#macro SHOT_DELAY 3
#macro SHOT_PLAYER_DAMAGE 5
#macro SHOT_PLAYER_SPEED 20
#macro SHOT_OPTION_DAMAGE 1
#macro SHOT_OPTION_SPEED 20

#macro PATTERN_STREAM 0

function scr_initialize() {
	randomize();
}