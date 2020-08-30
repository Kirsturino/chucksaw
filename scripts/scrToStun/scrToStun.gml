stunTimer = stunTimerMax;
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

state = scrStunned;