alarm[3] = fallingDeathTimer;

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

committedSeppuku = true;
fell = true;
audio_play_sound(sndFalling, 0, false);

state = scrFalling;