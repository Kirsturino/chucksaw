/// @description Fill floor with random splatters

if (!global.firstTime) exit;

//Draw splatter
if (!surface_exists(global.splatterSurf))
{
	global.splatterSurf = surface_create(640 + viewWidth, 360 + viewHeight);
} else
{
	surface_set_target(global.splatterSurf);
	draw_clear_alpha(c_white, 0);
	
	repeat (600)
	{
		var rad = random(16);
		var randX = random_range(-viewWidth / 2, 640 + viewWidth + viewWidth / 2);
		var randY = random_range(-viewHeight / 2, 360 + viewHeight + viewHeight / 2);
					
		draw_circle_color(randX + viewWidth / 2, randY + viewHeight / 2, rad, global.colDarkGrey, global.colDarkGrey, false);
	}
				
	surface_reset_target();
}