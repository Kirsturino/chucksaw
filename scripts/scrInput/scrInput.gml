//Get inputs
hAxis = gamepad_axis_value(controller, gp_axislh);

vAxis = gamepad_axis_value(controller, gp_axislv);

aButton = gamepad_button_check(controller, gp_face1);

aButtonPress = gamepad_button_check_pressed(controller, gp_face1);

aButtonRelease = gamepad_button_check_released(controller, gp_face1);