hitbox_rotator++;
bombing--;
invuln--;
recovery--;
emergency--;
hyper_time--;
shoot_delay--;
h_move = 0;
v_move = 0;

input_up = keyboard_check( vk_up );
input_down = keyboard_check( vk_down );
input_left = keyboard_check( vk_left );
input_right = keyboard_check( vk_right );
input_shot_left = keyboard_check( ord( "Z" ) );
input_shot_right = keyboard_check( ord( "C" ) );
input_focus = keyboard_check( vk_shift );
input_bomb = keyboard_check_pressed( ord("X") );

if ( hyper_time <= 0 ) {
	hyper_tier = HYPER_INACTIVE;
}

//bomb logic
if ( input_bomb && !bombing && !recovery) {
	//death bomb	
	if ( emergency ) {
		if ( hyper_current >= HYPER_COST && hyper_tier == HYPER_INACTIVE ) {
			hyper_current -= hyper_current;			//costs all hyper gauges, tier = maximum
			bombing = 60;
			invuln = 60;
			hyper_time = 420;
			hyper_tier = HYPER_TIER_3;
		} else if (bombs_current > 0 ) {
			bombs_current = 0;						//costs all bombs
			bombing = 300;
			invuln = 360;
//TODO: create death bomb object
			//instance_create
		}
	} else {
		if ( hyper_current >= HYPER_COST && hyper_tier == HYPER_INACTIVE ) {
			hyper_time = 240;
			while ( hyper_current >= HYPER_COST ) {	//costs all filled hyper gauges, tier = expended gauges
				hyper_current -= HYPER_COST;
				hyper_time += 60;
				hyper_tier += 1;
			}
			bombing = 60;
			invuln = 60;
		} else if ( bombs_current > 0 ) {
			bombs_current -= 1;						//costs 1 bomb
			bombing = 180;
			invuln = 180;
//TODO: create bomb object
			//instance_create
		}
	}
}
	
//movement logic
if ( !emergency && !recovery ) {
	//convert input bools to directions
	if ( input_up ) {
		v_move--;
	}
	if ( input_down ) {
		v_move++;
	}
	if ( input_left ) {
		h_move--;
	}
	if ( input_right ) {
		h_move++;
	}
	//move
	if ( h_move != 0 || v_move != 0 ) {
		if ( input_focus ) {
			x += lengthdir_x( FOCUS_SPEED, point_direction(0, 0, h_move, v_move) );
			y += lengthdir_y( FOCUS_SPEED, point_direction(0, 0, h_move, v_move) );
		} else {
			x += lengthdir_x( UNFOC_SPEED, point_direction(0, 0, h_move, v_move) );
			y += lengthdir_y( UNFOC_SPEED, point_direction(0, 0, h_move, v_move) );
		}
	}
	//enforce screen border
	if ( x > BOUNDARY_RIGHT ) {
		x = BOUNDARY_RIGHT;
	}
	if ( x < BOUNDARY_LEFT ) {
		x = BOUNDARY_LEFT;
	}
	if ( y > BOUNDARY_BOTTOM ) {
		y = BOUNDARY_BOTTOM;
	}
	if ( y < BOUNDARY_TOP ) {
		y = BOUNDARY_TOP;
	}
}

//shot and facing logic
if ( !emergency && !recovery ) {
	//change directions if only one is held
	if ( input_shot_left && !input_shot_right ) {
		face_dir = LEFT;		
	}
	if ( !input_shot_left && input_shot_right ) {
		face_dir = RIGHT;
	}
	if ( input_shot_left || input_shot_right ) {
		if ( shoot_delay <= 0 ) {
			shoot_delay = SHOT_DELAY;
			var shooty = instance_create_layer( x + (face_dir * 10), y + (TOP * 10), "Instances", obj_player_shot);
			with (shooty) {
				face_dir = other.face_dir;
				damage = SHOT_PLAYER_DAMAGE;
				speed = SHOT_PLAYER_SPEED;
				direction = 270 + (90 * face_dir);
				image_angle = direction;
			}
			var shooty = instance_create_layer( x + (face_dir * 10), y + (BOTTOM * 10), "Instances", obj_player_shot);
			with (shooty) {
				face_dir = other.face_dir;
				damage = SHOT_PLAYER_DAMAGE;
				speed = SHOT_PLAYER_SPEED;
				direction = 270 + (90 * face_dir);
				image_angle = direction;
			}
			for (var i = 0; i < 40; i += 10) {
				var shotia = instance_create_layer( top_option.x, top_option.y, "Instances", obj_option_shot);
				with (shotia) {
					face_dir = other.face_dir;
					damage = SHOT_OPTION_DAMAGE;
					speed = SHOT_OPTION_SPEED;
					direction = point_direction( other.x, other.y, other.top_option.x, other.top_option.y ) - (i * face_dir);
					image_angle = direction;
				}
				var shotia = instance_create_layer( bottom_option.x, bottom_option.y, "Instances", obj_option_shot);
				with (shotia) {
					face_dir = other.face_dir;
					damage = SHOT_OPTION_DAMAGE;
					speed = SHOT_OPTION_SPEED;
					direction = point_direction( other.x, other.y, other.bottom_option.x, other.bottom_option.y ) + (i * face_dir);
					image_angle = direction;
				}
			}
		}
	}
}