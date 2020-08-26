speedMultiplier = speedMultiplierDash;

var dir = point_direction(0, 0, lastHAxis, lastVAxis);
dashHAxis = lengthdir_x(1, dir);
dashVAxis = lengthdir_y(1, dir);

audio_play_sound(sndDash, 0, false);

state = scrDash;