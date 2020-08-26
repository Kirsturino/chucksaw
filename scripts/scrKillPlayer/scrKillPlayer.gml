var player = instance_place(x, y, oPlayer);
if (player != noone && player != owner && owner != noone)
{
	with (player)
	{
		if (state = scrAlive || state == scrStunned)
		{
			//if (oGameManager.gameState == game_states.playing)
			//{
			//	//Add score to player who owned the ball when killing someone
			//	global.playerScores[| other.owner.number - 1]++;
			//}
			
			//FX
			killDir = point_direction(other.x + other.hsp, other.y + other.vsp, other.x, other.y);
			scrSetPush(3 * other.spd, killDir);
			
			scrFreeze(100);
			
			//Change player state
			scrToDead();
		}
	}

	target = noone;
	
	//Reset homing target after a second
	alarm[1] = homingJankTimer;
}