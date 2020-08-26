part_type_color1(global.dashPart, aliveColor);

var dir = point_direction(x, y, x - hsp, y - vsp);
part_type_direction(global.dashPart,dir - 45,dir + 45,0,0);
part_type_size(global.dashPart,0.1,0.2,-0.01,0);
part_type_speed(global.sawPart,1,2,-0.002,0);

part_particles_create(global.partSystem, x, y, global.dashPart, 5);

var offset = 20;
part_type_size(global.windPart,0.2,0.3,-0.01,0);

for (var i = 0; i < 2; ++i)
{
	var partX = lengthdir_x(12, dir + 180) + lengthdir_x(2, dir + sign(offset) * 90);
	var partY = lengthdir_y(12, dir + 180) + lengthdir_y(2, dir + sign(offset) * 90);

	part_type_direction(global.windPart,dir + offset,dir + offset,0,0);
	part_particles_create(global.partSystem, x + partX, y + partY, global.windPart, 1);
	
	offset *= -1;
}