if (surface_exists(global.playerSurf))
{	
	surface_set_target(global.playerSurf)
	
	//Clear surface
	draw_clear_alpha(c_white, 0);
	
	with (oPlayer)
	{
		#region
		
		if (state != scrDead)
		{
			other.drawX = x + viewWidth;
			other.drawY = y + viewHeight;
		
			//Ball catch radius indicator
			hold = (1 - holdTimer / holdTimeMax) * 5;
			var shakeX = random_range(-hold, hold);
			var shakeY = random_range(-hold, hold);
			var radShake = random_range(-hold, hold);
	
			//c = c_black;
			//draw_circle_color(drawX + shakeX + 3, drawY + shakeY + 1, drawRadius + radShake, c, c, true);
	
			if (state == scrFalling) draw_set_alpha(alarm[3] / fallTimeMax);
			var c = color;
			draw_circle_color(other.drawX + shakeX, other.drawY + shakeY, drawRadius + radShake, c, c, false);
			draw_set_alpha(1);
	
			gpu_set_blendmode(bm_subtract);
			c = c_white;
			var hold = 1 - (1 - holdTimer / holdTimeMax);
			draw_circle_color(other.drawX + shakeX, other.drawY + shakeY, (drawRadius + radShake - 2) * hold, c, c, false);
			gpu_set_blendmode(bm_normal);
		}
		
		if (alarm[2] != -1)
		{
			c = color;
			var rad = 64;
			deflectCircleRadius = lerp(deflectCircleRadius, rad, 0.2);
			var wipeRad = 74;
			deflectWipeCircleRadius = lerp(deflectWipeCircleRadius, wipeRad, 0.1);
			
			draw_circle_color(other.drawX, other.drawY, deflectCircleRadius, c, c, false);
			gpu_set_blendmode(bm_subtract);
			c = c_white;
			draw_circle_color(other.drawX, other.drawY, deflectWipeCircleRadius, c, c, false);
			gpu_set_blendmode(bm_normal);
			
			c = global.colWhite;
			var rad = 32;
			deflectCircleRadius2 = lerp(deflectCircleRadius2, rad, 0.2);
			var wipeRad = 36;
			deflectWipeCircleRadius2 = lerp(deflectWipeCircleRadius2, wipeRad, 0.1);
			
			draw_circle_color(other.drawX, other.drawY, deflectCircleRadius2, c, c, false);
			gpu_set_blendmode(bm_subtract);
			c = c_white;
			draw_circle_color(other.drawX, other.drawY, deflectWipeCircleRadius2, c, c, false);
			gpu_set_blendmode(bm_normal);
		}
		#endregion
	}
	
	surface_reset_target();
		
	draw_surface(global.playerSurf, -viewWidth, -viewHeight);
} else
{
	global.playerSurf = surface_create(room_width + (viewWidth * 2), room_height + (viewHeight * 2));
}