if (catchBufferTimer > 0)
{
	catchBufferTimer = scrApproach(catchBufferTimer, 0, 1);
} else if (wantsToCatch)
{
	wantsToCatch = false;
	canCatch = false;
	catchCooldownTimer = catchCooldownMax;
}

if (catchCooldownTimer > 0)
{
	catchCooldownTimer = scrApproach(catchCooldownTimer, 0, 1);
} else if (!canCatch && !aButton)
{
	canCatch = true;
}

if (holdTimer > 0 && activeBall != noone)
{
	holdTimer = scrApproach(holdTimer, 0, 1);
}