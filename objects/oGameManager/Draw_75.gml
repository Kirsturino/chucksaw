if (gameState == game_states.declare_winner)
{
	var c = global.colBlack;
	//draw_set_alpha(clearAlpha);
	//draw_rectangle_color(0, 0 , viewWidth, viewHeight, c, c, c, c, false);
	//draw_set_alpha(1);
		
	draw_set_alpha(0.5);
	draw_line_width_color(-margin, winnerTextY - 2, (viewWidth + margin) * barY, winnerTextY - 2, 48, c_black, c_black);
	draw_set_alpha(1);
		
	draw_set_font(fGUIBig);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	c = winner.aliveColor;
	
	if (alarm[3] > 10)
	{
		winnerTextY = lerp(winnerTextY, viewHeight / 2 + 8, 0.1);
	} else
	{
		winnerTextY = lerp(winnerTextY, viewHeight * 1.5, 0.1);
	}
		
	scrColorTextShadow(viewWidth / 2, winnerTextY, "Player " + string(winner.number) + "\nis the winner!", c);
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}