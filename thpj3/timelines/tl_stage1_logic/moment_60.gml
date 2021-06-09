/// @desc moemura is cute

for ( var i = 0; i < 5; i++ ) {
	var popcorn = instance_create_layer( 1280, 100 + 120 * i, "enemy", obj_enemy_test );
	with ( popcorn ) {
		face_dir = LEFT;
		speed = 2;
		direction = 180;
	}
}