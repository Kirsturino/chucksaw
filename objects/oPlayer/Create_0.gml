//Misc. variables
number = 0;

//Controller deadzone jank
alarm[0] = 1;

//State machine
state = scrAlive;

//Movement variables
hsp = 0;
vsp = 0;
maxMoveSpeed = 3;
hAxis = 0;
vAxis = 0;
dashHAxis = 0;
dashVAxis = 0;
speedMultiplier = 1;
speedMultiplierDash = 4;
speedMultiplierFriction = 0.2;
dashTransitionSpeed = 1.5;
dashControl = 0.07;
triDir = 0;
lastHAxis = 0;
lastVAxis = 0;

//Ball catching and throwing
catchRadius = 32;
kickForce = 0;
minKickForce = 1;
maxKickForce = 8;
activeBall = noone;

aButton = 0;
aButtonPress = 0;
aButtonRelease = 0;

wantsToCatch = false;
canCatch = true;

committedSeppuku = false;

deflectRecoilAmount = 6;
stunnedFriction = 0.15;

//Timers
#macro catchBufferLength 20
catchBufferTimer = 0;

#macro catchCooldownMax 30
catchCooldownTimer = 0;

#macro holdTimeMax 60
holdTimer = holdTimeMax;

stunTimerMax = 20;
stunTimer = 0;

deflectBuffer = 8;
bufferedDash = false;
ballCatchDir = 0;

heldX = x;
heldY = y;
heldDir = 0;

fallingDeathTimer = 60;
fell = false;
fallSpinSpeed = 5;

#macro coyoteTime 24

//Graphics
playerSize = sprite_get_width(sPlayerHitBox) / 2;

aliveColor = noone;
color = aliveColor;
deadColor = c_dkgray;
colorTo = aliveColor;
drawRadius = catchRadius;
drawName = false;
deathFXLength = 12;
killDir = 0;
stunSpinSpeed = 40;

deflectFXTimer = 16;
deflectCircleRadius = 0;
deflectWipeCircleRadius = 0;
deflectCircleRadius2 = 0;
deflectWipeCircleRadius2 = 0;
deflectX = 0;
deflectY = 0;