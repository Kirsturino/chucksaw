/// @description Draw cinematic bars

//if (drawMode != draw_modes.gui) exit;

//if (surface_exists(global.barSurf))
//{
//	surface_set_target(global.barSurf);
	
//	draw_clear_alpha(c_white, 0);
	
//	var c = global.barColor;

//	draw_sprite_ext(sPixel, 0, topBarX, topBarY, barWidth, barHeight, topBarRot, c, 1);

//	draw_sprite_ext(sPixel, 0, botBarX, botBarY, barWidth, barHeight, botBarRot, c, 1);

//	//c = c_black;

//	//draw_sprite_ext(sPixel, 0, topBarX, topBarY2 - 2, barWidth, barHeight, topBarRot2, c, 1);

//	//draw_sprite_ext(sPixel, 0, botBarX, botBarY2 + 2, barWidth, barHeight, botBarRot2, c, 1);
	
//	gpu_set_blendmode(bm_normal);
	
//	surface_reset_target();
	
//	draw_surface(global.barSurf, 0, 0);
//} else
//{
//	global.barSurf = surface_create(viewWidth, viewHeight);
//}

var c = global.barColor;

draw_sprite_ext(sPixel, 0, topBarX, topBarY, barWidth, barHeight, topBarRot, c, 1);

draw_sprite_ext(sPixel, 0, botBarX, botBarY, barWidth, barHeight, botBarRot, c, 1);