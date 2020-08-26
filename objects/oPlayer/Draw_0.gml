//Draw representative sprite
if (state == scrFalling)
{
	drawRadius = lerp(drawRadius, 0, 0.05);
} else if (activeBall == noone)
{
	drawRadius = lerp(drawRadius, canCatch * (catchRadius + scrWave(-1, 1, 1, 0)), 0.3);
} else
{
	drawRadius = lerp(drawRadius, canCatch * catchRadius, 0.3);
}

//Draw name
if (drawName)
{
	draw_set_halign(fa_center);
	draw_set_font(fDebug);
	
	scrColorTextShadow(x, y - 18, "P" + string(number), aliveColor);
	
	draw_set_color(c_white);
	draw_set_halign(fa_left);
}

switch (state)
{
	case scrAlive:
		colorTo = aliveColor;
	break;
	
	case scrDead:
		colorTo = deadColor;
	break;
	
	case scrFalling:
		colorTo = c_black;
	break;
	
	default:
		colorTo = aliveColor;
	break;
}

if (wantsToCatch || activeBall != noone)
{
	colorTo = c_white;
}

//Lerp colors
if (state != scrFalling)
{
	color = merge_color(color, colorTo, 0.2);
} else
{
	color = merge_color(color, colorTo, 0.1);
}
if (state == scrFalling)
{
	var pd = point_direction(x, y, x + lastHAxis, y + lastVAxis);
	var dd = angle_difference(triDir, pd);
	triDir += fallSpinSpeed;
		
	var dist = playerSize * 2 * alarm[3] / fallingDeathTimer;
	
	var x1 = lengthdir_x(dist, triDir);
	var y1 = lengthdir_y(dist, triDir);
	
	var x2 = lengthdir_x(dist, triDir + 140);
	var y2 = lengthdir_y(dist, triDir + 140);
	
	var x3 = lengthdir_x(dist, triDir + 220);
	var y3 = lengthdir_y(dist, triDir + 220);
	
	//Drop shadow
	var c = c_black;
	draw_triangle_color(x + x1 + 3, y + y1 + 1, x + x2 + 3, y + y2 + 1, x + x3 + 3, y + y3 + 1, c_black, c_black, c_black, false);
	
	c = color;
	draw_triangle_color(x + x1, y + y1, x + x2, y + y2, x + x3, y + y3, c, c, c, false);
} else if (state != scrDead)
{
	if (state == scrStunned)
	{
		triDir += stunSpinSpeed;
	} else if (activeBall == noone && (abs(hAxis) >= global.deadzone / 10 || abs(vAxis) >= global.deadzone / 10))
	{
		//Track last dir
		lastHAxis = hAxis;
		lastVAxis = vAxis;
	} else if (activeBall != noone)
	{
		triDir = scrWave(0, (holdTimer / holdTimeMax) * 360, 0.5, 0);
	}
		
	var pd = point_direction(x, y, x + lastHAxis, y + lastVAxis);
	var dd = angle_difference(triDir, pd);
	triDir -= min(abs(dd), 25) * sign(dd);
		
	var dist = playerSize * 2 + scrWave(0, (1 - holdTimer / holdTimeMax) * 4, 0.2, 0);
	
	var x1 = lengthdir_x(dist, triDir);
	var y1 = lengthdir_y(dist, triDir);
	
	var x2 = lengthdir_x(dist, triDir + 140);
	var y2 = lengthdir_y(dist, triDir + 140);
	
	var x3 = lengthdir_x(dist, triDir + 220);
	var y3 = lengthdir_y(dist, triDir + 220);
	
	//Drop shadow
	var c = c_black;
	draw_triangle_color(x + x1 + 3, y + y1 + 1, x + x2 + 3, y + y2 + 1, x + x3 + 3, y + y3 + 1, c_black, c_black, c_black, false);
	
	c = color;
	draw_triangle_color(x + x1, y + y1, x + x2, y + y2, x + x3, y + y3, c, c, c, false);
}

if (alarm[1] != -1)
{
	//Death FX, extreme FX
	var rand = random_range(24, 48);
	var thickness = 8;
	if (alarm[1]  <= deathFXLength / 2 && alarm[1] != -1)
	{
		draw_circle_color(x, y, rand, global.colWhite, global.colWhite, false);
		draw_line_width_color(0, 0, room_width, room_height, thickness * alarm[1], global.colWhite, global.colWhite);
		draw_line_width_color(room_width, 0, 0, room_height, thickness * alarm[1], global.colWhite, global.colWhite);
	} else if (alarm[1] > deathFXLength / 2)
	{
		draw_circle_color(x, y, rand, c_black, c_black, false);
		draw_line_width_color(0, 0, room_width, room_height, thickness * alarm[1], c_black, c_black);
		draw_line_width_color(room_width, 0, 0, room_height, thickness * alarm[1], c_black, c_black);
	}
}

if (alarm[2] > deflectFXTimer - 4)
{
	draw_circle_color(deflectX, deflectY, 32, c_black, c_black, false);
} else if (alarm[2] > deflectFXTimer - 8)
{
	draw_circle_color(deflectX, deflectY, 32, global.colWhite, global.colWhite, false);
}