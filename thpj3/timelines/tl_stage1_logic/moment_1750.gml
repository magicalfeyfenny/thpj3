/// @desc large center fairy

var popcorn = instance_create_layer( 1280, 360, "enemy", obj_enemy_fairy_large_ring );
with ( popcorn ) {
	face_dir = LEFT;
	speed = 4;
	friction = .1;
	direction = 180;
}