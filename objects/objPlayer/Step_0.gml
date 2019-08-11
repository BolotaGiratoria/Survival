#region //Get player input
	if(hasControl) {
		//---------Atualiza inputs
		inputLeft = keyboard_check(vk_left) || keyboard_check(ord("A"));
		inputRight = keyboard_check(vk_right) || keyboard_check(ord("D"));
		inputUp	= keyboard_check(vk_up);
		inputDown = keyboard_check(vk_down);
		inputWalk = keyboard_check(vk_control);
		inputRun = keyboard_check(vk_shift);
		jumpKey = keyboard_check_pressed(vk_space);

		//---------Muda a velocidade
		if (inputWalk or inputRun){
			playSpeed = abs((inputWalk*slowSpeed) - (inputRun*runSpeed));
		} else {
			playSpeed = normalSpeed;
		}

		//---------Seta 0 nas variaveis
		var moveX = 0;
		var moveY = 0;

		//---------Logica de movimento
		moveX = (inputRight - inputLeft) * playSpeed;
		moveY = (inputDown - inputUp) * playSpeed;
		if(isJumping) {
			moveY = 0;
		}
	
		if (inputLeft) || (inputRight) || (inputUp) || (inputDown) || (jumpKey) {
			controller = 0;
		}

	} else {
		inputRight = 0;
		inputLeft = 0;
		inputDown = 0;
		inputUp = 0;
		jumpKey = 0;
	}
#endregion

#region //Calculate moviment

	horizontalSpeed = moveX + gunKickX + injureKickX;
	verticalSpeed = moveY + gunKickY + injureKickY;

#endregion

#region //Jumping


if(jumpPosition > 0) {
	jumpMove -= playerGravity;
	jumpPosition += jumpMove;
	isJumping = true;
} else {
	isJumping = false;
	jumpPosition = 0;
	firstJumpYPosition = noone;
	if(jumpKey) {
		firstJumpYPosition = y;
		jumpMove = jumpSpeed;
		jumpPosition = jumpMove;
	} else {
		jumpMove = 0;
	}
}

canJump -= 1;
if (canJump > 0) && (jumpKey) {
	canJump = 0;
}
#endregion

//Reset Variables
gunKickX = 0;
injureKickX = 0;
gunKickY = 0;
injureKickY = 0;

#region //Collide and move
//HorizontalCollision
if(place_meeting(x+horizontalSpeed, y, objWall)) {
	//Move player to the horizontal until player collide to wall
	while(!place_meeting(x+sign(horizontalSpeed), y, objWall)) {
		x = x + sign(horizontalSpeed)
	}
	horizontalSpeed = 0;
}
x = x + horizontalSpeed;

//VerticalCollision
if(place_meeting(x, y+verticalSpeed, objWall)) {
	//Move player to the vertical until player collide to wall
	while(!place_meeting(x, y+sign(verticalSpeed), objWall)) {
		y = y + sign(verticalSpeed);
	}
	
	verticalSpeed = 0;
	if(firstJumpYPosition != noone) {
		jumpMove = firstJumpYPosition - y;
	}
	jumpMove = -jumpMove;
}
y = y + verticalSpeed - jumpMove;


#endregion

#region Animations

var aimside = sign(mouse_x - x);
if(aimside != 0) image_xscale = aimside;

//check if player isnt colliding to the wall
if(isJumping) {
	//change to player sprites Jump
	sprite_index = sprPlayerJump;
	image_speed = 0;
	//change sprites to jumps sprite
	 image_index = 0
} else {
	canJump = 10;
	if(sprite_index == sprPlayerJump) {
		audio_sound_pitch(snLanding, choose(0.8, 1.0, 1.2, 1.4));
		audio_play_sound(snLanding, 6, false);
		repeat(5) {
			with(instance_create_layer(x, bbox_bottom + 1, "Dusts", objDust)) {
				scriptDrawDust(id, random_range(0.5, 1), random_range(0, 6), random_range(-2, 2), random_range(-2, 2), choose(1, -1), choose(1, -1));
				verticalSpeed = 0;
				
			}
		}
	}
	//Check if is running or not
	image_speed = 1;
	if(horizontalSpeed == 0) {
		sprite_index = sprPlayer;
	} else {
		repeat(5) {
			with(instance_create_layer(x, bbox_bottom + 1, "Dusts", objDust)) {
				scriptDrawDust(id, random_range(0.5, 1), random_range(6, 11), random_range(-2, 2), random_range(-2, 2), choose(1, -1), choose(1, -1));
				verticalSpeed = 0;
			}
		}
		sprite_index = sprPlayerRun;
		if(aimside != sign(horizontalSpeed)) {
			sprite_index = sprPlayerRunBack;
		}
	}
}

#endregion



