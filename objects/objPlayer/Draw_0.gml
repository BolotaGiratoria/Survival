
draw_self()

#region //set flash shader to shootable object
if(flash > 0) {
	flash--;
	shader_set(shWhite);
	draw_self();
	shader_reset();
}
#endregion