if (instance_exists(oGameManager))
{
	if (activeBall != noone || oGameManager.gameState == game_states.start) exit;
}

//Horizontal collision
dashHAxis = scrApproach(dashHAxis, lastHAxis, dashControl);
hsp = dashHAxis * maxMoveSpeed * speedMultiplier;

if (place_meeting(x + hsp, y, oCollision))
{
	while (!place_meeting(x + sign(hsp), y, oCollision))
	{
		x += sign(hsp);
	}
	
	//Negate momentum
	if (abs(dashVAxis) > 0.6)
	{
		hsp = 0;
	} else
	{
		hsp *= -0.5;
		scrToStun();
		
		//Small spark effect
		part_particles_create(global.topPartSystem, x, y, global.deflectPart, 10);
		
		scrSetShake(20, 10);
		scrSetPush(hsp * 5, point_direction(x, y, x + hsp, y + vsp));
		audio_play_sound(sndBonk, 0, false);
		audio_stop_sound(sndDash);
	}
}

//if (place_meeting(x + hsp, y, oCollisionPlayerOnly))
//{
//	while (!place_meeting(x + sign(hsp), y, oCollisionPlayerOnly))
//	{
//		x += sign(hsp);
//	}
	
//	//Negate momentum
//	if (abs(dashVAxis) > 0.6)
//	{
//		hsp = 0;
//	} else
//	{
//		hsp *= -0.5;
//		scrToStun();
		
//		//Small spark effect
//		part_particles_create(global.topPartSystem, x, y, global.deflectPart, 10);
		
//		scrSetShake(20, 10);
//		scrSetPush(hsp * 5, point_direction(x, y, x + hsp, y + vsp));
//		audio_play_sound(sndBonk, 0, false);
//		audio_stop_sound(sndDash);
//	}
//}

//Apply momentum
x += hsp;
x = scrWrap(x, 0 - catchRadius, room_width + catchRadius);

//Vertical collision
dashVAxis = scrApproach(dashVAxis, lastVAxis, dashControl);
vsp = dashVAxis * maxMoveSpeed * speedMultiplier;

if (place_meeting(x, y + vsp, oCollision))
{
	while (!place_meeting(x, y + sign(vsp), oCollision))
	{
		y += sign(vsp);
	}
	
	//Negate momentum
	if (abs(dashHAxis) > 0.6)
	{
		vsp = 0;
	} else
	{
		vsp *= -0.5;
		scrToStun();
		
		//Small spark effect
		part_particles_create(global.topPartSystem, x, y, global.deflectPart, 10);
		
		scrSetShake(20, 10);
		scrSetPush(vsp * 5, point_direction(x, y, x + hsp, y + vsp));
		audio_play_sound(sndBonk, 0, false);
		audio_stop_sound(sndDash);
	}
}

//if (place_meeting(x, y + vsp, oCollisionPlayerOnly))
//{
//	while (!place_meeting(x, y + sign(vsp), oCollisionPlayerOnly))
//	{
//		y += sign(vsp);
//	}
	
//	//Negate momentum
//	if (abs(dashHAxis) > 0.6)
//	{
//		vsp = 0;
//	} else
//	{
//		vsp *= -0.5;
//		scrToStun();
		
//		//Small spark effect
//		part_particles_create(global.topPartSystem, x, y, global.deflectPart, 10);
		
//		scrSetShake(20, 10);
//		scrSetPush(vsp * 5, point_direction(x, y, x + hsp, y + vsp));
//		audio_stop_sound(sndDash);
//		audio_play_sound(sndBonk, 0, false);
//	}
//}

//Apply momentum
y += vsp;
y = scrWrap(y, 0 - catchRadius, room_height + catchRadius);

//Dashing system
speedMultiplier = scrApproach(speedMultiplier, 1, speedMultiplierFriction);

if (speedMultiplier < dashTransitionSpeed) scrToAlive();