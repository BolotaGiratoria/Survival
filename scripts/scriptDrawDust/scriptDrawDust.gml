/// @desc scriptDrawDust(objDust, imageSpeed, imageIndex, horizontalSpeed, verticalSpeed, imageXScale, imageYScale)
///@arg objDust instance of dust object.
///@arg imageSpeed sets velocity of Image.
///@arg imageIndex sets image index.
///@arg horizontalSpeed set horizontal speed of dust.
///@arg verticalSpeed set vertical speed of dust.
///@arg imageXScale set x direction of dust.
///@arg imageYScale set y direction of dust.

with(argument0) {
	#region //Creating varibles
	if(argument_count == 7) {
		image_speed = argument1;
		image_index = argument2;
		horizontalSpeed = argument3;
		verticalSpeed = argument4;
		image_xscale = argument5;
		image_yscale = argument6;
	}
	#endregion
}
