gamepad_set_vibration(controller, 0, 0);

if (!place_meeting(x, y, oCollisionPlayerOnly))
{
	if (state == scrStunned)
	{
		part_type_color1(global.bullyPart, aliveColor);
		part_particles_create(global.partSystem, x, y, global.bullyPart, 10);
	}
	state = scrAlive;
} else
{
	scrToFalling();
}