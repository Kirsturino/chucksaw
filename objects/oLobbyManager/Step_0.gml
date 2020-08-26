if (gamepad_button_check_pressed(global.masterController, startButton) && readyToStart)
{
	alarm[0] = 30;
	scrSetCinemaBars(0, viewHeight / 2, 0.3, global.barColor);
	audio_play_sound(sndCloseCurtain, 0, false);
}

//Animate text
size = ds_list_size(global.controllers);

if (size > 0)
{
	joinTextY = lerp(joinTextY, joinTextYJoining, 0.1);
} else if (size >= 4)
{
	joinTextY = lerp(joinTextY, joinTextYFinal, 0.1);
} else
{
	joinTextY = lerp(joinTextY, joinTextYStart, 0.1);
}

if (readyToStart)
{
	instructionX = lerp(instructionX, instructionXFinal, 0.1);
	bottomLineX = lerp(bottomLineX, viewWidth, 0.2);
}