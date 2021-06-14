/// @desc shotgun fairy row

var popcorn = instance_create_layer( 1280, 300, "enemy", obj_enemy_fairy_shotgun );
with ( popcorn ) {
	face_dir = LEFT;
	speed = 4;
	direction = 180;
}