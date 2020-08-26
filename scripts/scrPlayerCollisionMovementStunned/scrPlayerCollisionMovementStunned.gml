//Horizontal collision
if (place_meeting(x + hsp, y, oCollision))
{
	while (!place_meeting(x + sign(hsp), y, oCollision))
	{
		x += sign(hsp);
	}
	
	//Negate momentum
	hsp = 0;
}

hsp = scrApproach(hsp, 0, stunnedFriction);

//Apply momentum
x += hsp;
x = scrWrap(x, 0 - catchRadius, room_width + catchRadius);

//Vertical collision
if (place_meeting(x, y + vsp, oCollision))
{
	while (!place_meeting(x, y + sign(vsp), oCollision))
	{
		y += sign(vsp);
	}
	
	//Negate momentumm
	vsp = 0;
}

vsp = scrApproach(vsp, 0, stunnedFriction);

//Apply momentum
y += vsp;
y = scrWrap(y, 0 - catchRadius, room_height + catchRadius);

//Dashing system
speedMultiplier = scrApproach(speedMultiplier, 1, speedMultiplierFriction);