//Get all available controllers from all slots
for (var i = 0; i < global.gpNum; i++;)
{
	if (gamepad_is_connected(i))
	{
		global.controllerSlots[i] = true;
	} else
	{
		global.controllerSlots[i] = false;
	}
}

addedController = noone;