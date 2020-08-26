if (surface_exists(global.splatterSurf))
{
	#region Ball trail
	surface_set_target(global.splatterSurf);
	with (oBall)
	{
		if (state == scrFree)
		{
			if (abs(xprevious - x) < 150 && abs(yprevious - y) < 150)
			{
				var jankX = viewWidth / 2;
				var jankY = viewHeight / 2;
		
				draw_set_alpha(0.5);
					draw_line_width_color(xprevious + jankX, yprevious + jankY, x + jankX, y + jankY, ballRadius / 2, c_black, c_black);
				draw_set_alpha(1);
			}
		}
	}
	surface_reset_target();
	#endregion
	
	#region Player smudges
	surface_set_target(global.splatterSurf);
	with (oPlayer)
	{
		if (abs(xprevious - x) < 150 && abs(yprevious - y) < 150)
		{
			var jankX = viewWidth / 2;
			var jankY = viewHeight / 2;
		
			draw_set_alpha(0.1);
			gpu_set_blendmode(bm_subtract);
			draw_line_width_color(xprevious + jankX, yprevious + jankY, x + jankX, y + jankY, playerSize, global.colGrey, global.colGrey);
			gpu_set_blendmode(bm_normal);
			draw_set_alpha(1);
		}
	}
	surface_reset_target();
	#endregion
	
	//Draw surface
	draw_set_alpha(alpha);
	draw_surface(global.splatterSurf, -viewWidth / 2, -viewHeight / 2);
	draw_set_alpha(1);
	
} else
{
	global.splatterSurf = surface_create(640 + viewWidth, 360 + viewHeight);
}

if (flashAlpha > 0)
{
	var c = flashColor;
	draw_rectangle_color(-viewWidth, -viewHeight, room_width + viewWidth, room_height + viewHeight, c, c, c, c, false);
}