if (instance_exists(oGameManager))
{
	if (oGameManager.gameState != game_states.playing) exit;
}

with (oCinemaBars)
{
	topBarRotTo = 0;
	topBarXTo = viewWidth / 2;
	topBarYTo = -barHeight * 2;

	botBarRotTo = 0;
	botBarXTo = viewWidth / 2;
	botBarYTo = viewHeight + (barHeight * 2);
	
	topBarYChange = 0;
	botBarYChange = 0;
}