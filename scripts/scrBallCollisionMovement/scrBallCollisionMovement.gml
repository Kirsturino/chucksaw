if (instance_exists(oGameManager))
{
	if (oGameManager.gameState == game_states.start) exit;
}

var moveDir = point_direction(x, y, x + hsp, y + vsp);

//Horizontal collision
if (place_meeting(x + hsp * spd, y, oCollision))
{
	var jankX = 0;
	while (!place_meeting(x + sign(hsp), y, oCollision))
	{
		x += sign(hsp);
		jankX++;
		
		if (jankX > 100) x += 16; 
	}
	
	//Reverse momentum
	hsp *= -1;
	hsp = max(abs(hsp), 0.5) * sign(hsp);
	
	//FX
	scrSetShake(spd * ballRadius / startBallRadius, 10);
	scrSetPush(spd * ballRadius / startBallRadius * 2, moveDir);
	part_particles_create(global.topPartSystem, x, y, global.deflectPart, round(spd * ballRadius * 0.3));
	audio_play_sound(sndSawWallImpact, 0, false);
	
}

if (place_meeting(x + hsp * spd, y, oCollisionBallOnly))
{
	var jankX = 0;
	while (!place_meeting(x + sign(hsp), y, oCollisionBallOnly))
	{
		x += sign(hsp);
		jankX++;
		
		if (jankX > 100) x += 16; 
	}
	
	//Reverse momentum
	hsp *= -1;
	hsp = max(abs(hsp), 0.5) * sign(hsp);
	
	//FX
	scrSetShake(spd * ballRadius / startBallRadius, 10);
	scrSetPush(spd * ballRadius / startBallRadius * 2, moveDir);
	part_particles_create(global.topPartSystem, x, y, global.deflectPart, round(spd * ballRadius * 0.3));
	audio_play_sound(sndSawWallImpact, 0, false);
	
}

//Apply homing
if (target != noone)
{
	var dir = point_direction(x, y, target.x, target.y);
	var amount = lengthdir_x(1, dir);
	hsp = scrApproach(hsp, amount, homingAccuracy);
}

hsp = clamp(hsp, -1, 1);
x += hsp * spd;
x = scrWrap(x, 0 - ballRadius, room_width + ballRadius);

//Vertical collision
if (place_meeting(x, y + vsp * spd, oCollision))
{
	var jankY = 0;
	while (!place_meeting(x, y + sign(vsp), oCollision))
	{
		y += sign(vsp);
		
		jankY++;
		
		if (jankY > 100) y =+ blockSize;
	}
	
	//Negate momentumm
	vsp *= -1;
	vsp = max(abs(vsp), 0.5) * sign(vsp);
	
	//FX
	scrSetShake(spd * ballRadius / startBallRadius, 10);
	scrSetPush(spd * ballRadius / startBallRadius * 2, moveDir);
	part_particles_create(global.topPartSystem, x, y, global.deflectPart, round(spd * ballRadius * 0.3));
	audio_play_sound(sndSawWallImpact, 0, false);
}

if (place_meeting(x, y + vsp * spd, oCollisionBallOnly))
{
	var jankY = 0;
	while (!place_meeting(x, y + sign(vsp), oCollisionBallOnly))
	{
		y += sign(vsp);
		
		jankY++;
		
		if (jankY > 100) y =+ blockSize;
	}
	
	//Negate momentumm
	vsp *= -1;
	vsp = max(abs(vsp), 0.5) * sign(vsp);
	
	//FX
	scrSetShake(spd * ballRadius / startBallRadius, 10);
	scrSetPush(spd * ballRadius / startBallRadius * 2, moveDir);
	part_particles_create(global.topPartSystem, x, y, global.deflectPart, round(spd * ballRadius * 0.3));
	audio_play_sound(sndSawWallImpact, 0, false);
}

//Apply homing
if (target != noone)
{
	var amount = lengthdir_y(1, dir);
	vsp = scrApproach(vsp, amount, homingAccuracy);
}

vsp = clamp(vsp, -1, 1);
y += vsp * spd;
y = scrWrap(y, 0 - ballRadius, room_height + ballRadius);

//Friction
spd = scrApproach(spd, minSpd, fric);
spd = clamp(spd, 0, maxSpd);
minSpd = clamp(minSpd, 2, maxSpd);

//Reset homing target if they're dead or falling
if (target != noone)
{
	if (target.state == scrDead || target.state == scrFalling) target = noone;
}