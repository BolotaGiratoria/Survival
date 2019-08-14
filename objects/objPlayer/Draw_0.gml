draw_sprite_ext(sprPlayerShadow, 0, x, y+1, 1, -0.75, 0, c_white, 0.5);
draw_self()

#region //set flash shader to shootable object
if(flash > 0) {
	flash--;
	shader_set(shWhite);
	draw_self();
	shader_reset();
}
#endregion