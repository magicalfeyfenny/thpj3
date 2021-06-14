/// @desc advancing column of wave fairies

for ( var i = 0; i < 5; i++ ) {
	var popcorn = instance_create_layer( 1280, 100 + 120 * i, "enemy", obj_enemy_fairy_wave );
	with ( popcorn ) {
		face_dir = LEFT;
		speed = 1;
		direction = 180;
	}
}