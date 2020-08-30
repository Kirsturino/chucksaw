color = c_dkgray;

//Remove player from active player list
var index = ds_list_find_index(global.players, id);
ds_list_delete(global.players, index);

//Check how many players are left alive, if only one, make that player the winner
var size = ds_list_size(global.players);

if (size == 1 && oGameManager.gameState == game_states.playing)
{
	oGameManager.alarm[4] = 60;
}

//Death FX
scrSetShake(30, 10);
if (fell)
{
	audio_stop_sound(sndFalling);
	audio_play_sound(sndFallDeath, 0, false);
	audio_play_sound(sndSplash, 0, false);
} else
{
	audio_play_sound(sndDeath, 0, false);
}

//Draw splatter
if (!fell)
{
	if (surface_exists(global.splatterSurf))
	{
		surface_set_target(global.splatterSurf);
				
		repeat (64)
		{
			var rad = random(16);
			var randX = x + lengthdir_x(random(124 - rad * 4), killDir - 180 + random_range(-30, 30));
			var randY = y + lengthdir_y(random(124 - rad * 4), killDir - 180 + random_range(-30, 30));
					
			draw_circle_color(randX + viewWidth / 2, randY + viewHeight / 2, rad, aliveColor, aliveColor, false);
		}
				
		surface_reset_target();
	}
}
part_type_color1(global.deathPart, aliveColor);
if (!committedSeppuku)
{
	part_type_direction(global.deathPart, killDir - 25 + 180, killDir + 25 + 180, 0, 0);
} else
{
	part_type_direction(global.deathPart,0,359,0,0);
}

if (!fell)
{
	repeat (100)
	{
		var size = random_range(0.1, 0.4);
		var spd = 10 - size * 4;
		part_type_size(global.deathPart,size,size,-0.002,0);
		part_type_speed(global.deathPart,1,spd,-spd * 0.02,0);

		part_particles_create(global.partSystem, x, y, global.deathPart, 1);
	}
} else
{
	repeat (20)
	{
		var size = random_range(0.05, 0.1);
		var spd = 1;
		part_type_size(global.deathPart,size,size,-0.002,0);
		part_type_speed(global.deathPart,0,spd,-spd * 0.02,0);

		part_particles_create(global.partSystem, x, y, global.deathPart, 1);
	}
}

if (!committedSeppuku)
{
	part_type_direction(global.deathPart2, killDir - 45 + 180, killDir + 45 + 180, 0, 0);
} else
{
	part_type_direction(global.deathPart2,0,359,0,0);
}

if (!fell)
{
	part_type_color1(global.deathPart2, aliveColor);
	part_particles_create(global.partSystem, x, y, global.deathPart2, 100);
}

//Camera zoom
scrSetZoom(0.7);

//Camera rotation
if (!fell)
{
	scrSetRotation(20, true);
} else
{
	scrSetRotation(10, true);
}

if (!fell)
{
	//Flash
	oSplatterHandler.flashColor = aliveColor;
	oSplatterHandler.flashAlpha = deathFXLength;

	//Set up effects for player death
	alarm[1] = deathFXLength;
}

//Set controller vibration
gamepad_set_vibration(controller, 1, 1);
gamepad_set_color(controller, c_red);

alarm[4] = 8;

state = scrDead();