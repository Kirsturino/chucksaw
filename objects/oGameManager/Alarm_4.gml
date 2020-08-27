/// @description Check if there is a winner
gameState = game_states.over;

var size = ds_list_size(global.players);

if (size > 0)
{
	winner = global.players[| 0];
	
	//Add score to survivor
	global.playerScores[| global.players[| 0].number - 1]++;
	
	scrCheckWinner();
} else if (size == 0)
{
	winner = noone;
}

//Restart game
alarm[0] = gameRestartLength;
	
scrResetCinemaBars();
	
audio_play_sound(sndUIEffect2, 0, false);