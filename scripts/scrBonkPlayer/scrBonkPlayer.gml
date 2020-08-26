var plr = instance_place(x, y, oPlayer);

if (plr != noone)
{
	if (plr.state != scrDead && plr.state != scrFalling && plr.state != scrStunned)
	{
		with (plr)
		{
			var dir = point_direction(other.x, other.y, other.x + other.hsp, other.y + other.vsp) + irandom_range(-30, 30);
			hsp = lengthdir_x(deflectRecoilAmount, dir);
			vsp = lengthdir_y(deflectRecoilAmount, dir);
		
			wantsToCatch = false;
			canCatch = false;
			catchCooldownTimer = catchCooldownMax;
			holdTimer = holdTimeMax;
			bufferedDash = false;
	
			scrToStun();
			
			//FX
			audio_play_sound(sndGottem, 0, false);
			audio_play_sound(sndSawWallImpact, 0, false);
			scrSetShake(10, 5);
			scrSetPush(5, dir);
			scrSetRotation(3, true);
			
			part_particles_create(global.partSystem, x, y, global.bullyPart, 10);
		}
	}
	
	if (plr.state == scrDash)
	{
		var dir = point_direction(x, y, x - hsp, y - vsp) + irandom_range(-30, 30);
		hsp = lengthdir_x(deflectRecoilAmount, dir);
		vsp = lengthdir_y(deflectRecoilAmount, dir);
		
		wantsToCatch = false;
		canCatch = false;
		catchCooldownTimer = catchCooldownMax;
		holdTimer = holdTimeMax;
		bufferedDash = false;
		
		scrToStun();
		
		//FX
		audio_play_sound(sndDeflect, 0, false);
		part_particles_create(global.partSystem, x, y, global.deflectPart, 10);
		
		alarm[2] = deflectFXTimer;
		plr.alarm[2] = deflectFXTimer;
	}
}