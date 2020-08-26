/// @description Homing jank
//This is megajank to prevent crashes and saw randomly not homing in
var size = ds_list_size(global.players);
var ballDir = point_direction(x, y, x + hsp, y + vsp);
var dirDiff = 9999;

for (var i = 0; i < size; ++i)
{
	targ = global.players[| i];
				
	if (targ != owner && targ.state != scrDead && targ != undefined)
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

if (target == undefined)
{
	target = noone;
}