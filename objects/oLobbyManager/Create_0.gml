startButton = gp_start;
readyToStart = false;

margin = 8;
joinTextYStart = viewHeight / 4 * 3;
joinTextYJoining = viewHeight / 12;
joinTextYFinal = -viewHeight;
joinTextY = 0;

size = 0;

instructionXStart = -viewWidth;
instructionXFinal = viewWidth / 2;
instructionX = instructionXStart;

bottomLineX = 0;

////Spawn players when returning to lobby
//if (!global.firstTime)
//{
//	readyToStart = true;
//	var controllerSize = ds_list_size(global.controllers);
	
//	//Add controllers to list of players if they indicate they're ready
//	for (var i = 0; i < controllerSize; i++;)
//	{
//		//Spawn dummy player character for player to control while in lobby
//		with (instance_create_layer(room_width / (controllerSize + 1) * (i + 1), room_height / 2, "Players", oPlayer))
//		{
//			controller = global.controllers[| i];
//			aliveColor = global.playerColours[i];
//			number = i + 1;
//			drawName = true;
//		}
//	}
//}

//if (global.music != mLobby)
//{
//	audio_stop_sound(global.music);
//	global.music = mLobby;
//	audio_play_sound(global.music, 0, true);
//}

audio_play_sound(sndOpenCurtain, 0, false);