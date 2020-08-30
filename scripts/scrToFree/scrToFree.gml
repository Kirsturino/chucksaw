//Change color to person who kicked the ball
if (instance_exists(owner)) colorTo = owner.playerColour;

//Get bigger when thrown, because reasons?
ballRadius *= sizeIncreaseMultiplier;
image_xscale *= sizeIncreaseMultiplier;
image_yscale *= sizeIncreaseMultiplier;

//This probably actually feels pretty bad
//Increase homing slightly
//homingAccuracy += 0.001;

if (audio_is_playing(sndCharge)) audio_stop_sound(sndCharge);

audio_sound_pitch(sndSawGrow, growPitch);
audio_sound_gain(sndSawGrowAdditional, min(growPitch * 0.05, 0.3), 0);
audio_play_sound(sndSawGrow, 0, false);
audio_play_sound(sndSawGrowAdditional, 0, false);
growPitch += 0.1;

state = scrFree;