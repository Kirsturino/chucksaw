if (catchBufferTimer > 0)
{
	catchBufferTimer = scrApproach(catchBufferTimer, 0, 1);
} else if (wantsToCatch)
{
	wantsToCatch = false;
	canCatch = false;
	catchCooldownTimer = catchCooldownMax;
	
	part_type_color1(global.bullyPart, global.colWhite);
	part_particles_create(global.partSystem, x, y, global.bullyPart, 10);
}

if (catchCooldownTimer > 0)
{
	catchCooldownTimer = scrApproach(catchCooldownTimer, 0, 1);
} else if (!canCatch && !aButton)
{
	canCatch = true;
	part_type_color1(global.bullyPart, global.colWhite);
	part_particles_create(global.partSystem, x, y, global.bullyPart, 10);
}

if (holdTimer > 0 && activeBall != noone)
{
	holdTimer = scrApproach(holdTimer, 0, 1);
}