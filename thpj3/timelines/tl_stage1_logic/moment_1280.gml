/// @desc column of aimed lane fairies

for ( var i = 0; i < 5; i++ ) {
	var popcorn = instance_create_layer( 1280, 100 + 120 * i, "enemy", obj_enemy_fairy_lane );
	with ( popcorn ) {
		face_dir = LEFT;
		speed = 1 + random(.5);
		friction = -.02
		direction = point_direction(x, y, obj_wriggle.x, obj_wriggle.y);
	}
}