///@description Draw text with shadow
///@param x
///@param y
///@param string
///@param color

var fnt = draw_get_font();
global.UIShadow = font_get_size(fnt) / 5;

draw_text_color(argument0 + global.UIShadow, argument1, argument2, c_black, c_black, c_black, c_black, 1);
draw_text_color(argument0, argument1, argument2, argument3, argument3, argument3, argument3, 1);