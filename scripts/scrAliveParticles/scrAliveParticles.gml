part_type_color1(global.dashPart, aliveColor);

var dir = point_direction(x, y, x - hsp, y - vsp);
part_type_direction(global.dashPart,dir - 20,dir + 20,0,0);
part_type_size(global.dashPart,0.08,0.12,-0.01,0);
var spd = abs(hsp) + abs(vsp) / 2;
part_type_speed(global.dashPart,spd / 2,spd,-0.002,0);

var partX = lengthdir_x(10, dir)
var partY = lengthdir_y(10, dir);
if ((abs(hsp) > 0 || abs(vsp) > 0) && activeBall == noone)
{
	if (random(1) > 0.5) part_particles_create(global.partSystem, x + partX + 1, y + partY + 1, global.dashPart, 1);
}