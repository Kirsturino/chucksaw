//Choose the target the ball should chase
size = ds_list_size(global.players);
ballDir = point_direction(x, y, x + hsp, y + vsp);
dirDiff = 9999;

for (var i = 0; i < size; ++i)
{
	targ = global.players[| i];
				
	if (targ != owner && !is_undefined(targ) && targ.state != scrFalling)
	{
		targDir = point_direction(x, y, targ.x, targ.y);
				
		if (abs(angle_difference(ballDir, targDir)) < dirDiff)
		{
			dirDiff = angle_difference(ballDir, targDir);
			chosenTarg = targ;
		}
	}
}

target = chosenTarg;

//Check if we have a target in one second
alarm[1] = homingJankTimer;