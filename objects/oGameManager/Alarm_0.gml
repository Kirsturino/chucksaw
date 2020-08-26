/// @description Restart game

if (gameState == game_states.over && gameWinner == noone)
{
	room_goto(scrChooseMap());
} else if (gameWinner != noone)
{
	gameState = game_states.declare_winner;
	scrSetCinemaBars(0, viewHeight / 2, 0.3, winner.aliveColor);
	alarm[3] = 240;
	audio_play_sound(sndUIEffect2, 0, false);
	audio_play_sound(sndCloseCurtain, 0, false);
}