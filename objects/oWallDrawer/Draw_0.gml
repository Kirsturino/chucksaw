if (surface_exists(global.lavaSurf))
{
	surface_set_target(global.lavaSurf);
	draw_clear_alpha(c_white, 0);
	
	with (oCollisionPlayerOnly)
	{
		var c2 = global.colNavy;
		var c = merge_color(c_black, global.colBlack, 0.8);
		var offsetX = viewWidth / 2;
		var offsetY = viewHeight / 2;
		
		draw_rectangle_color(bbox_left + offsetX, bbox_top + offsetY, bbox_right + offsetX, bbox_bottom + offsetY, c2, c2, c2, c2, false);
		draw_rectangle_color(bbox_left + offsetX, bbox_top + offsetY, bbox_right + offsetX, bbox_top + blockSize + offsetY, c, c, c, c, false);
		draw_rectangle_color(bbox_left + offsetX, bbox_top + blockSize + offsetY, bbox_right + offsetX, bbox_top + blockSize * 2 + offsetY, c, c, c2, c2, false);
	}
	
	surface_reset_target();
	
	//var darkC = merge_color(c_black, global.colNavy, 0.2);
	//var c = merge_color(global.colNavy, darkC, scrWave(0, 1, 12, 0));
	//shader_set(shdWave);
	//shader_set_uniform_f(uTime,current_time/1000 * spd);
	//shader_set_uniform_f(uFrequency, frequency);
	//shader_set_uniform_f(uIntensity, intensity);
	
	draw_surface(global.lavaSurf, -viewWidth / 2, -viewHeight / 2);
	
	//shader_reset();
} else
{
	global.lavaSurf = surface_create(640 + viewWidth, 360 + viewHeight);
}