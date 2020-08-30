switch (gameState)
{
	case game_states.start:
		countDownX = lerp(countDownX, countDownXFinal, 0.2);
		countDownX2 = lerp(countDownX2, countDownXFinal2, 0.1);
		
		if (alarm[2] == gameStartLength / 4 || alarm[2] == gameStartLength / 4 * 2 || alarm[2] == gameStartLength / 4 * 3)
		{
			countDownX = -viewWidth;
			countDownX2 = viewWidth / 2;
			
			if (alarm[2] != gameStartLength / 4) audio_play_sound(sndCountdown, 0, false);
			else audio_play_sound(sndGo, 0, false);
		}
	break;
	
	case game_states.over:
		clearAlpha = scrApproach(clearAlpha, 0.8, 0.01);
		
		if (alarm[0] == 20 && gameWinner == noone)
		{
			if (winner != noone) scrSetCinemaBars(0, viewHeight / 2, 0.3, winner.aliveColor);
			else scrSetCinemaBars(0, viewHeight / 2, 0.3, global.barColor);
			
			audio_play_sound(sndCloseCurtain, 0, false);
			scrSetShake(50, 20);
		} else if (alarm[0] > 20) scrResetCinemaBars();
	break;
	
	case game_states.declare_winner:
		clearAlpha = scrApproach(clearAlpha, 0, 0.01);
	break;
}