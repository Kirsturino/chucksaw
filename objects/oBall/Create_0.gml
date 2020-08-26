//Graphics
colorTo = global.colLightGrey;
color = 0;
heldColor = global.colWhite;

ballRadius = sprite_get_width(sBallHitBox) / 2;
startBallRadius = ballRadius;
spinSpeed = 4;
spinDir = 0;

part_type_size(global.sawPart,0.1,0.2,0,0);

//Movement
maxSpd = 12;
minSpd = 2;
minSpdStart = minSpd;
spawnSpd = minSpd;
spd = spawnSpd;
hsp = 0;
vsp = 0;
fric = 0.15;
homingAccuracy = 0.02;

//Misc.
owner = noone;
target = noone;
targ = noone;
chosenTarg = noone;
homingJankTimer = 180;

sizeIncreaseMultiplier = 1.05;
previousX = x;
previousY = y;
previousDist = 0;
previousLength = 2;
alarm[0] = previousLength; 

growPitch = 1;

//Init state machine
state = scrFree;