if (instance_exists(oGameManager))
{
	if (oGameManager.gameState == game_states.start) exit;
}

var ball = collision_circle(x, y, catchRadius, oBall, false, false);

var lineToBall = false;

if (ball != noone)
{
	lineToBall = collision_line(x, y, ball.x, ball.y, oCollision, false, false);
	
	if (lineToBall == noone) collision_line(x, y, ball.x, ball.y, oCollisionBallOnly, false, false);
}

//Calculate where ball should be when holding
if (abs(hAxis) > global.deadzone || abs(vAxis) > global.deadzone) heldDir = point_direction(0, 0, hAxis, vAxis);

var collX = x + lengthdir_x(catchRadius, heldDir);
var collY = y + lengthdir_y(catchRadius, heldDir);

if (activeBall == noone)
{
	var collRadius = 16;
} else
{
	var collRadius = activeBall.ballRadius;
}

if (collision_circle(collX, collY, collRadius, oCollision, false, false) == noone && collision_circle(collX, collY, collRadius, oCollisionBallOnly, false, false) == noone)
{
	heldX = x + lengthdir_x(catchRadius, heldDir);
	heldY = y + lengthdir_y(catchRadius, heldDir);
}

//Buffer input so player can press catch a bit early and still make it
if (aButtonPress && canCatch && !wantsToCatch)
{
	wantsToCatch = true;
	catchBufferTimer = catchBufferLength;
}

if (wantsToCatch && ball != noone && aButton && ball.state != scrHeld && lineToBall == noone)
{
	wantsToCatch = false;
	activeBall = ball;
	holdTimer = holdTimeMax;
	audio_play_sound(sndCatch, 0, false);
	audio_play_sound(sndCharge, 0, false);
	
	with (activeBall)
	{	
		if (state == scrFree)
		{
			//Mark owner
			owner = other;
			
			other.ballCatchDir = other.heldDir;
			
			//Change state
			scrToHeld();
		}
	}
} else if (aButtonRelease && activeBall != noone)
{
	if (catchBufferTimer > catchBufferLength - deflectBuffer && abs(angle_difference(heldDir, ballCatchDir)) < 45 && !bufferedDash)
	{
		bufferedDash = true;
		scrDeflectBall();
	} else
	{
		scrThrowBall();
	}
}  else if (aButtonRelease && activeBall == noone)
{
	if (wantsToCatch) scrToDash();
	if (catchBufferTimer != 0) catchCooldownTimer = catchCooldownMax;
	catchBufferTimer = 0;
	wantsToCatch = false;
	canCatch = false;
} else if (aButton && holdTimer == 0 && activeBall != noone)
{
	committedSeppuku = true;
	scrThrowBall();

	scrToDead();
} else if (aButton && activeBall != noone)
{
	//Slowly zoom in when holding blade
	var hold = 1 - (1 - holdTimer / holdTimeMax) * .1;
	scrSetZoom(hold);
	
	var hold = 1 - holdTimer / holdTimeMax;
	scrSetShake(hold * 30, 1);
	scrSetRotation(scrWave(-1, 1, 0.2, 0), false);
	scrSetPush(10, heldDir);
	
	gamepad_set_vibration(controller, hold, hold);
	
	repeat (2)
	{
		part_type_color1(global.holdPart, aliveColor);
		var partX = lengthdir_x(irandom_range(32, 64), irandom(360));
		var partY = lengthdir_y(irandom_range(32, 64), irandom(360));
		var partDir = point_direction(x + partX, y + partY, x, y) + 90;
		part_type_direction(global.holdPart, partDir, partDir, -3, 0);

		part_particles_create(global.partSystem, x + partX, y + partY, global.holdPart, 1);
	}
	
	if (oGameManager.gameState == game_states.playing) scrSetCinemaBars(hAxis * 5, 8 * hold, 0.2, aliveColor);
}