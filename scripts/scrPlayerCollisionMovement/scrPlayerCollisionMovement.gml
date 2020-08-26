if (instance_exists(oGameManager))
{
	if (activeBall != noone || oGameManager.gameState == game_states.start) exit;
}

//Horizontal collision
hsp = hAxis * maxMoveSpeed * speedMultiplier;

if (place_meeting(x + hsp, y, oCollision))
{
	while (!place_meeting(x + sign(hsp), y, oCollision))
	{
		x += sign(hsp);
	}
	
	//Negate momentum
	hsp = 0;
}

//Apply momentum
x += hsp;
x = scrWrap(x, -catchRadius, room_width + catchRadius);

//Vertical collision
vsp = vAxis * maxMoveSpeed * speedMultiplier;

if (place_meeting(x, y + vsp, oCollision))
{
	while (!place_meeting(x, y + sign(vsp), oCollision))
	{
		y += sign(vsp);
	}
	
	//Negate momentumm
	vsp = 0;
}

//Apply momentum
y += vsp;
y = scrWrap(y, -catchRadius, room_height + catchRadius);

//Dashing system
speedMultiplier = scrApproach(speedMultiplier, 1, speedMultiplierFriction);