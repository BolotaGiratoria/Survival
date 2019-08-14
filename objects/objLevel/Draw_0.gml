
#region //Create shadow surface in walls
	if (!surface_exists(shadowSurface)) {
		// Create the shadow surface
		shadowSurface = surface_create(room_width, room_height);
		surface_set_target(shadowSurface);
		draw_clear_alpha(c_black, 0);
	
		for (var _y = 1; _y < levelHeight-1; _y++) {
			for (var _x = 1; _x < levelWidth-1; _x++) {
				if (levelGrid[# _x, _y] == FLOOR && levelGrid[# _x, _y-1] == VOID) {
					draw_sprite_ext(sprShadow, 0, _x*CELLWIDTH, _y*CELLHEIGHT, 1, 1, 0, c_white, .5);
				}
			}
		}
		surface_reset_target()
		show_debug_message("Surface created");
	}
	draw_surface(shadowSurface, 0, 0);
#endregion
