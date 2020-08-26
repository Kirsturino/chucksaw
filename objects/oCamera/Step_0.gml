//Apply effects
scrShake();
scrPush();
scrZoom();
scrRotate();

var spd = 0.1;

xTo = lerp(xTo, shakeX + pushX, spd);
yTo = lerp(yTo, shakeY + pushY, spd);

camera_set_view_pos(view, xTo + zoomOffsetX, yTo + zoomOffsetY);