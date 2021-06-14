/// @desc wave fairy down column

var popcorn = instance_create_layer( 900, 0, "enemy", obj_enemy_fairy_wave );
with ( popcorn ) {
	face_dir = LEFT;
	speed = 1.5;
	direction = 270;
}