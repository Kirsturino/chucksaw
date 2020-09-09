if (activeBall != noone)
{
	with (activeBall)
	{
		if (owner == other && state == scrHeld)
		{
			scrToFree();
			
			var dir = other.heldDir;
			hsp = lengthdir_x(1, dir);
			vsp = lengthdir_y(1, dir);
			minSpd += .2;
				
			//Increase kick force when flicking ball
			var hold = 1 - other.holdTimer / holdTimeMax;
			var flickOrCharge = max(maxDist, hold * other.maxKickForce * 1.3);
			
			other.kickForce = clamp(flickOrCharge, other.minKickForce, other.maxKickForce);
			
			spd += other.kickForce;
			scrChooseHomingTarget();
			
			//FX
			scrSetPush(max(other.kickForce, spd) * 3, dir);
			scrSetZoom(1 - (other.kickForce / other.maxKickForce) / 50);
			audio_play_sound(sndThrow, 0, false);
			audio_play_sound(sndSawThrow, 0, false);
			scrFreeze(60);
			
			if (other.kickForce == other.maxKickForce)
			{
				part_type_color1(global.bullyPart, other.aliveColor);
				part_particles_create(global.partSystem, x, y, global.bullyPart, 20);
				audio_play_sound(sndPerfectThrow, 0, false);
			}
			
		}
	}
}
	
wantsToCatch = false;
canCatch = false;
catchCooldownTimer = catchCooldownMax;
activeBall = noone;
holdTimer = holdTimeMax;
gamepad_set_vibration(controller, 0, 0);
scrResetCinemaBars();