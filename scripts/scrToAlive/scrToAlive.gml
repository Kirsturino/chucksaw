gamepad_set_vibration(controller, 0, 0);

if (!place_meeting(x, y, oCollisionPlayerOnly))
{
	state = scrAlive;
} else
{
	scrToFalling();
}