
#region //Draw Life Bar

if (room == roomGame) {
	var pc;
	pc = (global.playerHP / global.playerMaxHP) * 100;
	var healthBarTitle = "Life: "
	draw_set_color(c_white);
	draw_set_font(fHealthBar);
	scriptDrawSetText(c_black, fHealthBar, fa_left, fa_top);
	draw_text(15, 15, healthBarTitle);
	draw_set_color(c_white);
	draw_text(17, 17, healthBarTitle);
	draw_healthbar(70, 22.5, 170, 39.5, pc, c_black, c_red, c_lime, 0, true, false);
}
#endregion
/* TODO
#region //Draw Score
	if (room != roomMenu) && (instance_exists(objPlayer)) && (global.kills > 0){
		killTextScale = max(killTextScale * 0.95, 1);
		scriptDrawSetText(c_black, fMenu, fa_right, fa_top);
		draw_text_transformed(RESWIDTH - 8, 12, string(global.kills) + " Pointless Murders : (", killTextScale, killTextScale, 0);
		draw_set_color(c_white);
		draw_text_transformed(RESWIDTH - 10, 10, string(global.kills) + " Pointless Murders : (", killTextScale, killTextScale, 0);
	}
#endregion
*/