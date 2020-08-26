//Set up quick reference
#macro view view_camera[0]

//Setup camera variables
camera_set_view_pos(view, 0, 0);
window_set_size(viewWidth * global.windowScale, viewHeight * global.windowScale);

//Center view
alarm[0] = 1;

//Apply camera
camera_set_view_size(view, room_width, room_height);
surface_resize(application_surface, viewWidth , viewHeight);


//Camera variables
xTo = 0;
yTo = 0;

//Camera shake variables
shakeDuration = 0;
shakeAmount = 0;
shakeX = 0;
shakeY = 0;

//Camera push variables
pushX = 0;
pushY = 0;

//Camera zoom stuff
zoomMultiplier = 1;
zoomLerpSpeed = 0.1;
zoomOffsetX = 0;
zoomOffsetY = 0;

//Camera rotation
rot = 0;