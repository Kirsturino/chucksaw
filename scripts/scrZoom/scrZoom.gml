zoomMultiplier = lerp(zoomMultiplier, 1, zoomLerpSpeed);

zoomOffsetX = viewWidth - (viewWidth * zoomMultiplier);
zoomOffsetY = viewHeight - (viewHeight * zoomMultiplier);

camera_set_view_size(view, room_width * zoomMultiplier, room_height * zoomMultiplier);