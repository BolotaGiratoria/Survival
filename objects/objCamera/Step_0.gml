///@desc Update Camera

//Update destination
if(instance_exists(follow)) {
	xTo = follow.x;
	yTo = follow.y;
	/*
	if((follow).object_index == objPlayerDead) {
		x = xTo;
		y = yTo;
	}
	*/
}

//Update object position
x += (xTo - x)/ 25;
y += (yTo - y)/ 25;

x = clamp(x, viewWidthHalf + shakeBuffer, room_width - viewWidthHalf - shakeBuffer);
y = clamp(y, viewHeightHalf + shakeBuffer, room_height - viewHeightHalf - shakeBuffer);

//Shake Camera
x += random_range(-shakeRemain, shakeRemain);
y += random_range(-shakeRemain, shakeRemain);
shakeRemain = max(0, shakeRemain - ((1/shakeDuration)*shakeMagnitude));

//Update camera view
camera_set_view_pos(camera, x - viewWidthHalf, y - viewHeightHalf);

/* TODO Parallax
if(layer_exists("Mountains")) {
	layer_x("Mountains", x/2);
}
if(layer_exists("Trees")) {
	layer_x("Trees", x/4);
}
*/