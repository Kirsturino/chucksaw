//Check if we fall in pits
if (place_meeting(x, y, oCollisionPlayerOnly))
{
	coyoteTimer = scrApproach(coyoteTimer, coyoteTime, 1);
} else
{
	coyoteTimer = 0;
}

if (coyoteTimer == coyoteTime) scrToFalling();