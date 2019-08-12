#region //Get player input

	//Set HasControl to false, when is changing room
	if(hasControl) {
		//Check Inputs
		inputLeft = keyboard_check(vk_left) || keyboard_check(ord("A"));
		inputRight = keyboard_check(vk_right) || keyboard_check(ord("D"));
		inputUp	= keyboard_check(vk_up)|| keyboard_check(ord("W"));
		inputDown = keyboard_check(vk_down)|| keyboard_check(ord("S"));
		inputWalk = keyboard_check(vk_control);
		inputRun = keyboard_check(vk_shift);
		jumpKey = keyboard_check_pressed(vk_space);

		//Change Speed
		if (inputWalk or inputRun){
			playSpeed = abs((inputWalk*slowSpeed) - (inputRun*runSpeed));
		} else {
			playSpeed = normalSpeed;
		}

		//Reset variables
		var moveX = 0;
		var moveY = 0;

		//Moviment Logic
		moveX = (inputRight - inputLeft) * playSpeed;
		moveY = (inputDown - inputUp) * playSpeed;
		//Dont Allow to move Y If is jumping
		if(isJumping) {
			moveY = 0;
		}

	} else {
		//Dont allow move if hasnt control
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

#region //Reset Kick back variables
	gunKickX = 0;
	injureKickX = 0;
	gunKickY = 0;
	injureKickY = 0;
#endregion

#region //Collide and move
//HorizontalCollision
if(place_meeting(x+horizontalSpeed, y, objCollision)) {
	//Move player to the horizontal until player collide to wall
	while(!place_meeting(x+sign(horizontalSpeed), y, objCollision)) {
		x = x + sign(horizontalSpeed)
	}
	horizontalSpeed = 0;
}
x = x + horizontalSpeed;

//VerticalCollision
if(place_meeting(x, y+verticalSpeed, objCollision)) {
	//Move player to the vertical until player collide to wall
	while(!place_meeting(x, y+sign(verticalSpeed), objCollision)) {
		y = y + sign(verticalSpeed);
	}
	
	verticalSpeed = 0;
	//If Collides with something when jump, move back to origin
	if(firstJumpYPosition != noone) {
		jumpMove = firstJumpYPosition - y;
	}
	//Change direction of jump
	jumpMove = -jumpMove;
}

if(!(objPlayer.x >= 0 and objPlayer.x <= room_width and
       objPlayer.y >= 0 and objPlayer.y <= room_height))
    {
      verticalSpeed = 0
	  //Change direction of jump
		jumpMove = -jumpMove;
    }
y = y + verticalSpeed - jumpMove;


#endregion

#region Animations

//Change sprite checking where player is watching
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
	
	//Allow player to jump if he has just pass from wall
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



