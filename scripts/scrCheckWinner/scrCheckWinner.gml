//Check if anyone has enough points to win
var size = ds_list_size(global.playerScores);
var weHaveAWinnerDingDingDing = false;

for (var i = 0; i < size; ++i)
{
		if (global.playerScores[| i] >= oGameManager.pointsToWin) weHaveAWinnerDingDingDing = true;
}
				
if (weHaveAWinnerDingDingDing) oGameManager.gameWinner = oGameManager.winner;