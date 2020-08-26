//Add controllers to list of players if they indicate they're ready
for (var i = 0; i < global.gpNum; i++;)
{
	//See if game thinks a slot has a controller
	if (global.controllerSlots[i])
	{
		//See if a slot that has a controller presses A/X
		if (gamepad_button_check_pressed(i, gp_face1))
		{
			var size = ds_list_size(global.controllers);
			
			//If they press A/X, add the ID of that controller to a list if it's not there already
			if (ds_list_find_index(global.controllers, i) == -1 && size < 4)
			{
				//Add reference to transfer to player object
				addedController = i;
				
				//Spawn dummy player character for player to control while in lobby
				with (instance_create_layer(room_width / 2, room_height / 2, "Players", oPlayer))
				{
					controller = other.addedController;
					var size = ds_list_size(global.controllers);
					aliveColor = global.playerColours[size];
					number = size + 1;
					drawName = true;

					if (size == 0 && global.masterController == noone)
					{
						global.masterController = controller;
					}
					
					scrSetCinemaBars(random_range(-2, 2), 4, 0.1, aliveColor);
				}
				
				//Add player controller to list
				ds_list_add(global.controllers, i);
				
				//Clear reference
				addedController = noone;
				
				//FX
				audio_play_sound(sndUIEffect, 0, false);
				scrSetShake(10, 10);
			}
			
			size = ds_list_size(global.controllers);
			if (size > 1) oLobbyManager.readyToStart = true;
		}
	}
}