/// @description Set deadzone, colour jank

//See who controls this boi
//show_debug_message("Player spawned with the controller ID " + string(controller));
gamepad_set_axis_deadzone(controller, global.deadzone);
gamepad_set_color(controller, aliveColor);
gamepad_set_vibration(controller, 0, 0);

playerColour = aliveColor;