var ball = instance_place(x, y, oBall);

//Register a hit
if (ball != noone || bufferedDash)
{
	if (bufferedDash) ball = activeBall;
	if (ball.state == scrHeld && !bufferedDash)
	{
		audio_play_sound(sndGottem, 0, false);
		part_type_color1(global.bullyPart, global.colWhite);
		part_particles_create(global.partSystem, x, y, global.bullyPart, 10);
	}
	
	with (ball)
	{	
		with (owner)
		{
			wantsToCatch = false;
			canCatch = false;
			catchCooldownTimer = catchCooldownMax;
			activeBall = noone;
			holdTimer = holdTimeMax;
			gamepad_set_vibration(controller, 0, 0);
		}
		
		var dir = point_direction(other.x, other.y, other.x + other.hsp, other.y + other.vsp);
		
		//Change player direction
		other.hsp = lengthdir_x(other.deflectRecoilAmount, dir + 180);
		other.vsp = lengthdir_y(other.deflectRecoilAmount, dir + 180);
		
		owner = other;
		colorTo = owner.aliveColor;

		hsp = lengthdir_x(1, dir);
		vsp = lengthdir_y(1, dir);
		minSpd += .2;
				
		//Increase kick force when flicking ball
		spd += other.maxKickForce;
			
		scrChooseHomingTarget();
		
		scrToFree();	
		
		//FX
		scrSetShake(30, 10);
		scrSetPush(spd * 3, dir + 180);
		scrSetZoom(0.95);
		scrSetRotation(5, true);
		gamepad_set_vibration(other.controller, 1, 1);
		part_particles_create(global.partSystem, x, y, global.deflectPart, 100);
		audio_play_sound(sndDeflect, 0, false);
		audio_play_sound(sndNoise, 0, false);
		scrFreeze(100);
	}
	
	//Reset stuff
	if (bufferedDash) activeBall = noone;
	wantsToCatch = false;
	canCatch = false;
	catchCooldownTimer = catchCooldownMax;
	holdTimer = holdTimeMax;
	bufferedDash = false;
	
	//Deflect FX
	alarm[2] = deflectFXTimer;
	deflectCircleRadius = 0;
	deflectCircleRadius2 = 0;
	deflectWipeCircleRadius = 0;
	deflectWipeCircleRadius2 = 0;
	deflectX = ball.x;
	deflectY = ball.y;
	if (oGameManager.gameState == game_states.playing) scrSetCinemaBars(choose(-5, 5), 8, 0.2, aliveColor);
	
	scrToStun();
}