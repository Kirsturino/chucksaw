//Check if we fall in pits
if (place_meeting(x, y, oCollisionPlayerOnly))
{
	fallTimer = scrApproach(fallTimer, fallTimeMax, 1);
} else if (fallTimer != 0)
{
	fallTimer = 0;
}

if (fallTimer == fallTimeMax) scrToFalling();