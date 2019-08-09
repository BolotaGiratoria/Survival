/// @desc ScreenShake(magnitude, frames)
/// @arg Magnitude sets the strength of the shake (radius in pixels)
/// @arg Frames sets the length of the shake in frames (60 = 1 second at 60fps)

with(objCamera) {

	if(argument0 > shakeRemain) {
		shakeMagnitude = argument0;
		shakeRemain = argument0;
		shakeDuration = argument1;
	}
}