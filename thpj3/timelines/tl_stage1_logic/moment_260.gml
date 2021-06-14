/// @desc popcorn corner burst

for ( var i = 0; i < 5; i++ ) {
	var popcorn = instance_create_layer( 1280, 620, "enemy", obj_enemy_popcorn );
	with ( popcorn ) {
		face_dir = LEFT;
		speed = 2 + random(1);
		direction = 180 - 10 * i;
	}
	var popcorn = instance_create_layer( 1280, 620, "enemy", obj_enemy_popcorn );
	with ( popcorn ) {
		face_dir = LEFT;
		speed = 1 + random(1);
		direction = 180 - 10 * i;
	}
}