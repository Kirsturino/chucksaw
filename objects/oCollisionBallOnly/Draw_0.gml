/// @description Draw representative sprite


//Draw shape shadow
draw_roundrect_color_ext(bbox_left + 3, bbox_top, bbox_right + 3, bbox_bottom, 8, 8, c_black, c_black, false);

//Draw shape
draw_roundrect_color_ext(bbox_left, bbox_top + 2, bbox_right, bbox_bottom, 8, 8, global.colGrey, global.colGrey, false);

//Draw top of shape
draw_roundrect_color_ext(bbox_left, bbox_top, bbox_right, bbox_bottom - 8, 8, 8, global.colLightGrey, global.colLightGrey, false);