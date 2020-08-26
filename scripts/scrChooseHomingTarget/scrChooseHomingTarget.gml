//Choose the target the ball should chase
var size = ds_list_size(global.players);
var ballDir = point_direction(x, y, x + hsp, y + vsp);
var dirDiff = 9999;

for (var i = 0; i < size; ++i)
{
	targ = global.players[| i];
				
	if (targ != owner && targ.state != scrDead && !is_undefined(targ))
	{
		var targDir = point_direction(x, y, targ.x, targ.y);
				
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