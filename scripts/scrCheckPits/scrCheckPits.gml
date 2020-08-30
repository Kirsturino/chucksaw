//Check if we fall in pits
if (collision_point(x, y, oCollisionPlayerOnly, false, false) != noone)
{
	coyoteTimer = scrApproach(coyoteTimer, coyoteTime, 1);
} else
{
	coyoteTimer = 0;
}

if (coyoteTimer == coyoteTime) scrToFalling();