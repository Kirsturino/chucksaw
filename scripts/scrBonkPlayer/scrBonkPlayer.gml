var plr = collision_circle(x, y, 16, oPlayer, false, true);

if (plr != noone)
{
	if (plr.state != scrDead && plr.state != scrFalling && plr.state != scrStunned)
	{
		var dir = point_direction(x, y, x - hsp, y - vsp) + irandom_range(-20, 20);
		var megaBonk = false;
		
		if (plr.state == scrDash)
		{
			var megaBonk = true;
			
			hsp = lengthdir_x(bonkRecoilAmount, dir);
			vsp = lengthdir_y(bonkRecoilAmount, dir);
		
			wantsToCatch = false;
			canCatch = false;
			catchCooldownTimer = catchCooldownMax;
			holdTimer = holdTimeMax;
			bufferedDash = false;
			
			scrToStun();
		
			//FX
			audio_play_sound(sndDeflect, 0, false);
			part_particles_create(global.partSystem, x, y, global.deflectPart, 10);
		
			deflectX = x;
			deflectY = y;
			alarm[2] = deflectFXTimer;
			plr.deflectX = x;
			plr.deflectY = y;
			plr.alarm[2] = deflectFXTimer;
		} else
		{
			//Change player direction
			hsp = lengthdir_x(deflectRecoilAmount / 2, dir + 180);
			vsp = lengthdir_y(deflectRecoilAmount / 2, dir + 180);
	
			scrToStun();
		}
	
		with (plr)
		{

			var dir = point_direction(other.x, other.y, other.x + other.hsp, other.y + other.vsp) + irandom_range(-20, 20);
			
			if (other.state == scrDash) dir += 180;

			
			hsp = lengthdir_x(bonkRecoilAmount, dir);
			vsp = lengthdir_y(bonkRecoilAmount, dir);
		
			wantsToCatch = false;
			canCatch = false;
			catchCooldownTimer = catchCooldownMax;
			holdTimer = holdTimeMax;
			bufferedDash = false;
			
			if (activeBall != noone) 
			{
				with (activeBall)
				{
					scrToFree();
					owner = noone;
					colorTo = global.colLightGrey;
				}
				activeBall = noone; 
			}
	
			scrToStun();
			
			//FX
			audio_play_sound(sndGottem, 0, false);
			audio_play_sound(sndSawWallImpact, 0, false);
			scrSetShake(10, 5);
			scrSetPush(5, dir);
			scrSetRotation(3, true);
			
			part_type_color1(global.bullyPart, global.colWhite);
			part_particles_create(global.partSystem, x, y, global.bullyPart, 10);
		}
		
		if (megaBonk)
		{
			randDir = irandom(359);
			hsp = lengthdir_x(bonkRecoilAmount, randDir);
			vsp = lengthdir_y(bonkRecoilAmount, randDir);
			
			with (plr)
			{
				hsp = lengthdir_x(bonkRecoilAmount, other.randDir + 180);
				vsp = lengthdir_y(bonkRecoilAmount, other.randDir + 180);
			}
			
		}
	}
}