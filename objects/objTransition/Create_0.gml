///@desc Size variables and mode setup

width = display_get_width();
height = display_get_height();

middleHeight = height * 0.5;
enum TransictionMode {
	OFF,
	NEXT,
	GOTO,
	RESTART,
	INTRO
}

mode = TransictionMode.INTRO;
percent = 1;
target = room;