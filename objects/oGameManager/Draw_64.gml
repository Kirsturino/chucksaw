/// @description Draw the game state on screen

switch (gameState)
{
	case game_states.over:
	#region
		var c = c_black;
		//draw_set_alpha(clearAlpha);
		//draw_rectangle_color(0, 0 , viewWidth, viewHeight, c, c, c, c, false);
		//draw_set_alpha(1);
	
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_font(fGUIBig);
	
		//Declare survivor
		draw_set_alpha(0.5);
		draw_line_width_color(-margin, 39, (viewWidth + margin) * barY, 39, 32, c_black, c_black);
		draw_set_alpha(1);
		
		if (winner != noone)
		{
			var c = global.playerColours[winner.number - 1];
			scrColorTextShadow(viewWidth / 2 * barY, 40, "Player " + string(winner.number) + " survives!", c);
		} else
		{
			var c = global.colWhite;
			scrColorTextShadow(viewWidth / 2 * barY, 40, "No one survives!", c);
		}

	
		//Show score
		var size = ds_list_size(global.playerScores);
		draw_set_font(fGUISmall);
		
		//Get highest score
		var scr = -1;
		
		for (var i = 0; i < size; ++i)
		{
			if (global.playerScores[| i] > scr)
			{
				scr = global.playerScores[| i];
				var leader = i;
			}
		}
		
		if (winner != noone)
		{
			if (ds_list_find_value(global.playerScores, winner.number - 1) == ds_list_find_value(global.playerScores, leader)) 
			{
				leader = winner.number - 1;
			}
		}
		
		var scr = string(scr);
		
		draw_set_color(global.colWhite);
		var winLineY = viewHeight - 101;
		
		if (winner != noone) c = winner.aliveColor;
		else c = global.colWhite;
		
		draw_line_width_color(-margin, winLineY, (viewWidth + margin) * barY, winLineY, 2, c, c);
			
		for (var i = 0; i < size; ++i)
		{
			var barHeight = viewHeight - 100 * (global.playerScores[| i] / pointsToWin) * barY;
			barHeight = max(barHeight, viewHeight - 100)
		
			c = c_black;
			draw_line_width_color(viewWidth / (size + 1) * (i + 1) + global.UIShadow, viewHeight + margin, viewWidth / (size + 1) * (i + 1) + global.UIShadow, barHeight, 32, c, c);
			
			c = merge_color(global.colWhite, global.playerColours[i], barY);
			//draw_text(viewWidth / (size + 1) * (i + 1), viewHeight - 16, "Player " + string(i + 1));
			draw_line_width_color(viewWidth / (size + 1) * (i + 1), viewHeight + margin, viewWidth / (size + 1) * (i + 1), barHeight, 32, c, c);
			
			if (leader == i)
			{
				//draw_text(viewWidth / (size + 1) * (i + 1), barHeight - 8, scr);
				var c = c_black;
				draw_triangle_color(viewWidth / (size + 1) * (i + 1) - 6, barHeight - 8 - scrWave(-2, 4, 2, 0), viewWidth / (size + 1) * (i + 1) + 10, barHeight - 8 - scrWave(-2, 4, 2, 0), viewWidth / (size + 1) * (i + 1) + 2, barHeight - 20 - scrWave(-2, 4, 2, 0), c, c, c, false);
				
				var c = global.playerColours[i];
				draw_triangle_color(viewWidth / (size + 1) * (i + 1) - 8, barHeight - 8 - scrWave(-2, 4, 2, 0), viewWidth / (size + 1) * (i + 1) + 8, barHeight - 8 - scrWave(-2, 4, 2, 0), viewWidth / (size + 1) * (i + 1), barHeight - 20 - scrWave(-2, 4, 2, 0), c, c, c, false);
			}
			
			draw_set_color(c_white);
		}
	
		barY = lerp(barY, 1, 0.1);
	
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_set_font(fDebug);
		#endregion
	break;

	case game_states.start:
	#region
	
		draw_set_alpha(0.5);
		draw_line_width_color(-margin, viewHeight / 2, viewWidth, viewHeight / 2, 86, c_black, c_black);
		draw_set_alpha(1);
		
		draw_set_font(fGUIHuge);
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		var c = global.colWhite;
	
		if (alarm[2] > gameStartLength / 4)
		{
			var txt = string(floor(alarm[2] / (gameStartLength / 4)));
			var txt2 = string(ceil(alarm[2] / (gameStartLength / 4)));
		} else
		{
			var txt = "GO!";
			var txt2 = "1";
		}
		scrColorTextShadow(countDownX, viewHeight / 2 + 2, txt, c);
		if (txt != "3") scrColorTextShadow(countDownX2, viewHeight / 2 + 2, txt2, c);
	
		draw_set_color(c_white);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		#endregion
	break;
}