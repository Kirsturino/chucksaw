//Debug
if (gamepad_button_check_pressed(global.masterController, restartButton) && global.debugging) room_goto(scrChooseMap());

if (gamepad_button_check_pressed(global.masterController, debugButton)) global.debugging = !global.debugging;

if (keyboard_check_pressed(vk_escape)) game_end();

//Debug
if (keyboard_check_pressed(ord("R")))
{
	room_restart();
}