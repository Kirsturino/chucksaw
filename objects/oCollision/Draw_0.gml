//Draw wall graphics

//Draw shape shadow
if (drawShadow) draw_roundrect_color_ext(bbox_left + 3, bbox_top, bbox_right + 3, bbox_bottom, roundness, roundness, c_black, c_black, false);

//Draw shape walls
draw_roundrect_color_ext(bbox_left - 1, bbox_top - blockSize, bbox_right, bbox_bottom, roundness, roundness, global.colGrey, global.colGrey, false);

//Draw roof of shape
draw_roundrect_color_ext(bbox_left - 1, bbox_top - blockSize, bbox_right, bbox_bottom - blockSize, roundness, roundness, global.colLightGrey, global.colLightGrey, false);