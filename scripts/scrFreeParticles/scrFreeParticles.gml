if (oGameManager.gameState == game_states.start) exit;

var partAmount = ceil(spd / 5 * ballRadius / 5);
var dir = point_direction(x + hsp, y + vsp, x, y);
//Increase particle size
part_type_size(global.sawPart,ballRadius / 150, ballRadius / 120, -0.01 * ballRadius / startBallRadius,0);
part_type_direction(global.sawPart,dir - 20,dir + 20,0,0);

repeat (partAmount)
{
	var randX = x + lengthdir_x(ballRadius / 2, random(359));
	var randY = y + lengthdir_y(ballRadius / 2, random(359));

	part_particles_create(global.partSystem, randX, randY, global.sawPart, 1);
}


if (spd > minSpdStart + 2 && (abs(hsp) > 0.4 || abs(vsp) > 0.4))
{
	var offset = 45;
	part_type_size(global.windPart,ballRadius / 100,ballRadius / 100,-0.01 * ballRadius / startBallRadius,0);

	for (var i = 0; i < 2; ++i)
	{
		var partX = lengthdir_x(ballRadius / 4 * 3, dir + 180) + lengthdir_x(ballRadius / 8 * 7, dir + sign(offset) * 90);
		var partY = lengthdir_y(ballRadius / 4 * 3, dir + 180) + lengthdir_y(ballRadius / 8 * 7, dir + sign(offset) * 90);

		part_type_direction(global.windPart,dir + offset * max(0.2, (1 - spd / maxSpd)),dir + offset * max(0.2, (1 - spd / maxSpd)),0,0);
		part_particles_create(global.partSystem, x + partX, y + partY, global.windPart, 1);
	
		offset *= -1;
	}
}