//Init controller array
global.gpNum = gamepad_get_device_count();
global.controllerSlots = array_create(global.gpNum, false);
global.controllers = ds_list_create();
global.masterController = noone;
global.players = ds_list_create();
global.playerScores = ds_list_create();

//Set default deadzone
global.deadzone = 0.2;

//Init camera
#macro viewWidth 320
#macro viewHeight 180
global.windowScale = 3;

//Meta stuff
global.debugging = false;
global.firstTime = true;

//Player colors
global.playerColours = array_create(4);
global.playerColours[0] = player1Colour;
global.playerColours[1] = player2Colour;
global.playerColours[2] = player3Colour;
global.playerColours[3] = player4Colour;

//Other colours
global.colWhite = colWhite;
global.colBlack = colBlack;
global.colGrey = colGrey;
global.colLightGrey = colLightGrey;
global.colDarkGrey = colDarkGrey;
global.colOrange = colOrange;
global.colRed = colRed;
global.colYellow = colYellow;
global.colPurple = colPurple;
global.colPink = colPink;
global.colBlue = colBlue;
global.colNavy = colNavy;
global.colGreen = colGreen;

//UI Stuff
global.UIShadow = 0;
global.barColor = player1Colour;

//Init surfaces
global.ballSurf = noone;
global.splatterSurf = noone;
global.playerSurf = noone;
global.lavaSurf = noone;

//Init particles
scrInitParticles();

//Init level array
global.levels = ds_list_create();
scrPopulateLevels();

//Music
//global.music = noone;

randomize();

room_goto(rmLobby);