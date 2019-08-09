/// @desc Draw Black Bars
if(mode != TransictionMode.OFF) {
	draw_set_color(c_black);
	draw_rectangle(-1, 0, width, percent * middleHeight, false);
	draw_rectangle(-1, height, width,height - (percent*middleHeight), false);
	
}


