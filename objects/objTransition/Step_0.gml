/// @des Progress Transaction

if(mode !=  TransictionMode.OFF) {
	if(mode == TransictionMode.INTRO) {
		percent = max(0, percent - max((percent/10), 0.005));
	} else {
		percent = min(1.2, percent + max(((1.2 - percent)/10), 0.005));
	}
	if((percent == 1.2) || (percent == 0)) {
		switch (mode) {
			case TransictionMode.INTRO: {
				mode = TransictionMode.OFF;
				break;
			}
			case TransictionMode.NEXT: {
				mode = TransictionMode.INTRO;
				room_goto_next();
				break;
			}
			case TransictionMode.GOTO: {
				mode = TransictionMode.INTRO;
				room_goto(target);
				break;
			}
			case TransictionMode.RESTART: {
				game_restart();
				break;
			}
		}
	}
}