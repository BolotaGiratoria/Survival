/// @desc Slide scriptSlideTransition(mode, targetRoom)
///@arg Mode set transition mode between next, restart and goto.
///@arg Target sets TargetRoom when using goto Mode.
with(objTransition) {
	mode = argument[0];
	if(argument_count > 1) {
		target = argument[1];
	}
}
