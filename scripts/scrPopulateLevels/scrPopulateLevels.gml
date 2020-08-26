var level = rmTest;

while (room_exists(level))
{
	ds_list_add(global.levels, level);
	level++;
}