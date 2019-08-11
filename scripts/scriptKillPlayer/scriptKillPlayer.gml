/// @desc scriptKillPlayer(invincibleTime)
///@arg invincibleTime count of time that player is invincible.
var invulnerability = argument0; 
#region //Check if player is invincible
/* TODO
if(invincible == false) {
	invincible = true;
	alarm_set(0,invulnerability);
	global.playerHP--;
	flash = 3;
	#region //Just move back player when is hitted
		injureKickX = lengthdir_x(1.5, other.image_angle);
		injureKickY = lengthdir_y(1.0, other.image_angle);
	#endregion
}
*/
#endregion

#region //Player Death
/* TODO
if(global.playerHP <= 0) {
	with(objGun) instance_destroy();
	instance_change(objPlayerDead, true);

	direction = point_direction(other.x, other.y, x, y);
	horizontalSpeed = lengthdir_x(6, direction)
	verticalSpeed = lengthdir_y(4, direction) -2;
	if(sign(horizontalSpeed) != 0) {
		image_xscale = sign(horizontalSpeed);
	}
	global.kills -= global.killsThisRoom;
}
*/
#endregion
	