global.firstTime = false;

//Delay player spawns for everything to init properly
spawnX = 0;
spawnY = 0;
alarm[1] = 1;

//Game variables
enum game_states
{
	start,
	playing,
	over,
	declare_winner
}

//Init game state

//Start each game with brief countdown
gameState = game_states.start;
gameStartLength = 100;
alarm[2] = gameStartLength;

gameRestartLength = 180;

winner = noone;
gameWinner = noone;
pointsToWin = 10;

//UI Graphics
clearAlpha = 0;
barY = 0;
winnerTextY = -viewHeight;
margin = 8;
countDownX = -viewWidth;
countDownXFinal = viewWidth / 2;
countDownX2 = viewWidth / 2;
countDownXFinal2 = viewWidth * 2;

//if (global.music != mGame)
//{
//	audio_stop_sound(global.music);
//	global.music = mGame;
//	audio_play_sound(global.music, 0, true);
//}

audio_play_sound(sndOpenCurtain, 0, false);
audio_play_sound(sndCountdown, 0, false);