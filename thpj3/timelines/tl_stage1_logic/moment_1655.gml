/// @desc burst fairy row

var popcorn = instance_create_layer( 1280, 520, "enemy", obj_enemy_fairy_burst );
with ( popcorn ) {
	face_dir = LEFT;
	speed = 1;
	direction = 180;
}