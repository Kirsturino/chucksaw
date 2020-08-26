//Display controller statuses
draw_set_font(fGUIBig);
draw_set_color(global.colWhite);
draw_set_halign(fa_left);

//var textHeight = font_get_size(fGUIBig) + margin;
//var c = c_white;

//for (var i = 0; i < global.gpNum; i++;)
//{
//	c = c_white;
	
//	if (global.controllerSlots[i])
//	{
//		//Debug to see which controller is which
//		if (gamepad_button_check(i, gp_face1)) c = c_yellow;
		
//		scrColorTextShadow(0, i * textHeight, "Slot " + string(i) + " has a controller", c, c, c, c, 1);
//	} else
//	{
//		scrColorTextShadow(0, i * textHeight, "Slot " + string(i) + " does not have a controller", c, c, c, c, 1);
//	}
//}


var c = c_black;
draw_set_alpha(0.5);
draw_line_width_color(-margin, joinTextY, viewWidth + margin, joinTextY, 32, c, c);
draw_set_alpha(1);

draw_set_halign(fa_center);
draw_set_valign(fa_center);
c = global.colWhite;
scrColorTextShadow(viewWidth / 2, joinTextY + 2, "Press A to join", c);

if (readyToStart)
{
	var c = c_black;
	draw_set_alpha(0.5);
	draw_line_width_color(-margin, viewHeight - margin, bottomLineX, viewHeight - margin, 32, c, c);
	draw_set_alpha(1);

	draw_set_font(fGUISmall);
	var width = string_width("Player 1");
	var width2 = string_width(", press START to play");
	draw_set_halign(fa_center);
	c = global.playerColours[0];
	scrColorTextShadow(instructionX - width2 / 2, viewHeight - margin - 2, "Player 1", c);
	c = global.colWhite;
	scrColorTextShadow(instructionX + width / 2, viewHeight - margin - 2, ", press START to play", c);
	scrColorTextShadow(instructionX + width / 2 + width2 / 2, viewHeight - margin - scrWave(4, 2, 1, 0), " !", c);
	
}

draw_set_valign(fa_top);

//var listSize = ds_list_size(global.controllers);
//for (var i = 0; i < listSize; i++;)
//{
//	//var controllerValue = global.controllers[| i];
	
//	////Debug to see which controller is which
//	//if (gamepad_button_check(controllerValue, gp_face1)) c = c_yellow else c = c_white;
	
//	c = global.playerColours[i];
//	scrColorTextShadow(margin, margin + i * textHeight, "Player " + string(i + 1), c, c, c, c, 1);
//}

//draw_set_color(c_white);