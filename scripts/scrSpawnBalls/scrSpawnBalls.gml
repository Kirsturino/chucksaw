with (oSpawnPointBall)
{
	other.spawnX = x;
	other.spawnY = y;
	with (instance_create_layer(other.spawnX, other.spawnY, "Ball", oBall))
	{
		var size = ds_list_size(global.players);
		target = global.players[| irandom(size - 1)];
	}
}