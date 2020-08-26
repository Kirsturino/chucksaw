if (surface_exists(global.ballSurf))
{
	surface_set_target(global.ballSurf)
	
	//Clear surface
	draw_clear_alpha(c_white, 0);
	
	with (oBall)
	{
		#region
		draw_set_alpha(1);
		
		//Draw representative sprite
		color = merge_color(color, colorTo, 0.2);

		//Draw spikes along the edge of the ball
		var spikeAmount = 8;
		var spikeBase = ballRadius - 4;
		var spikeTip = ballRadius + ballRadius / 8;
		var spikeDir = 360 / spikeAmount;
		var drawX = x + viewWidth;
		var drawY = y + viewHeight;

		if (state = scrFree) spinSpeed = spd * 2;
		spinDir = scrApproach(spinDir, 360, spinSpeed);
		if (spinDir == 360) spinDir = 0;
		
		//Drop shadow for saw
		draw_circle_color(drawX + 3, drawY + 1, spikeBase, c_black, c_black, false);
		
		gpu_set_blendmode(bm_subtract);
		draw_circle_color(drawX + 3, drawY + 1, ballRadius / 4, c_white, c_white, false);
		gpu_set_blendmode(bm_normal);

		for (var i = 0; i < spikeAmount; ++i)
		{
				var x1 = drawX + lengthdir_x(spikeBase, spikeDir * i + spinDir);
				var y1 = drawY + lengthdir_y(spikeBase, spikeDir * i + spinDir);
				var x2 = drawX + lengthdir_x(spikeBase, spikeDir * (i + 1) + spinDir);
				var y2 = drawY + lengthdir_y(spikeBase, spikeDir * (i + 1) + spinDir);
				var x3 = drawX + lengthdir_x(spikeTip, spikeDir * i + spinDir);
				var y3 = drawY + lengthdir_y(spikeTip, spikeDir * i + spinDir);
				
				//Drop shadow
				draw_triangle_color(x3 + 3, y3 + 1 , x1 + 3, y1 + 1, x2 + 3, y2 + 1, c_black, c_black, c_black, false);
				
				//Sawblades
			    draw_triangle_color(x3, y3, x1, y1, x2, y2, color, color, color, false);
		}
		
		//Draw saw
		draw_circle_color(drawX, drawY, spikeBase, color, color, false);
		
		//Draw hole in saw
		gpu_set_blendmode(bm_subtract);
		draw_circle_color(drawX, drawY, ballRadius / 4, c_white, c_white, false);
		gpu_set_blendmode(bm_normal);
		#endregion
	}
	
	surface_reset_target();
		
	draw_surface(global.ballSurf, -viewWidth, -viewHeight);
} else
{
	global.ballSurf = surface_create(room_width + (viewWidth * 2), room_height + (viewHeight * 2));
}