//Debug
if (gamepad_button_check_pressed(global.masterController, restartButton) && global.debugging) room_goto(scrChooseMap());

//if (gamepad_button_check_pressed(global.masterController, debugButton)) global.debugging = !global.debugging;

if (keyboard_check_pressed(vk_escape) && (room == rmLobby || global.debugging))
{
	alarm[0] = 40;
	scrSetCinemaBars(0, viewHeight / 2, 0.3, global.barColor);
	audio_play_sound(sndCloseCurtain, 0, false);
}

//Debug
if (keyboard_check_pressed(ord("R")) && global.debugging)
{
	room_restart();
}