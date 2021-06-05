draw_sprite_ext( spr_wriggle, image_index, x, y, -1 + (2 * face_dir), 1, 0, c_white, 1 * ( max( 1, recovery ) % 3 ) );

draw_sprite_ext( spr_wriggle_hitbox, 0, x, y, 2, 2, hitbox_rotator, c_white, .75);
draw_sprite_ext( spr_wriggle_hitbox, 0, x, y, 1, 1, -hitbox_rotator, c_white, 1);