var player = instance_place(x, y, oPlayer);
if (player != noone && player != owner && owner != noone)
{
	with (player)
	{
		if (state = scrAlive || state == scrStunned)
		{
			if (activeBall != noone) 
			{
				with (activeBall)
				{
					owner = noone;
					colorTo = global.colLightGrey;
					scrToFree();
				}
				activeBall = noone; 
			}
			
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