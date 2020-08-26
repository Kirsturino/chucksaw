///// @description Draw cinematic bars

//if (drawMode != draw_modes.draw) exit;

//if (surface_exists(global.barSurf))
//{
//	surface_set_target(global.barSurf);
	
//	draw_clear_alpha(c_white, 0);
	
//	var c = global.barColor;

//	draw_sprite_ext(sPixel, 0, topBarX, topBarY, barWidth, barHeight, topBarRot, c, 1);

//	draw_sprite_ext(sPixel, 0, botBarX, botBarY, barWidth, barHeight, botBarRot, c, 1);
	
//	//Exclude players and saws from the bars
//	gpu_set_blendmode(bm_subtract);
	
//	with (oPlayer)
//	{
//		draw_circle_color(x, y, drawRadius * 1.5, c_white, c_white, false);
//	}
	
//	with (oBall)
//	{
//		draw_circle_color(x, y, ballRadius * 1.5, c_white, c_white, false);
//	}

//	gpu_set_blendmode(bm_normal);
	
//	surface_reset_target();
	
//	draw_surface(global.barSurf, camera_get_view_x(view), camera_get_view_y(view));
//} else
//{
//	global.barSurf = surface_create(640, 360);
//}