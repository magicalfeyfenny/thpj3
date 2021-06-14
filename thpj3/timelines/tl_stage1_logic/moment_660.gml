/// @desc popcorn spam

for ( var i = 0; i < 4; i++ ) {
	var popcorn = instance_create_layer( 1280, 100 + random(520), "enemy", obj_enemy_popcorn );
	with ( popcorn ) {
		face_dir = LEFT;
		speed = 2 + random(1);
		direction = 160 + random(40);
	}
}