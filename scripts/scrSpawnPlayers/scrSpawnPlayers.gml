//Spawn and manage players
var playerAmount = ds_list_size(global.controllers);
spawnX = 0;
spawnY = 0;

for (var i = 0; i < playerAmount ; ++i)
{
	with (oSpawnPointPlayer)
	{
		if (number == i)
		{
			other.spawnX = x;
			other.spawnY = y;
		}
	}
	
    with (instance_create_layer(spawnX, spawnY, "Players", oPlayer))
	{
		controller = global.controllers[| i];
		aliveColor = global.playerColours[i];
		number = i + 1;
		ds_list_add(global.players, id);
		
		if (ds_list_find_value(global.playerScores, i) == undefined)
		{
			ds_list_add(global.playerScores, 0);
		}
	}
}