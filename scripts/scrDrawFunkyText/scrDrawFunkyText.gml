///@desc Draw text, but funky
///@param x
///@param y
///@param text
///@param color
///@param alpha
///@param funkAmount

var xx = argument0;
var yy = argument1;
var txt = argument2;
var c = c_black;
var alpha = argument4;
var funkModifier = argument5;

//Funk-a-lize text, yo
xx += scrWave(-4, 2, 2, 0) * funkModifier;
yy += scrWave(-3, 5, 3, 0) * funkModifier;

var angle = scrWave(-5, 5, 4, 0) * funkModifier;
var scale = scrWave(1, 1.2, 2, 0.5) * funkModifier;

draw_text_transformed_color(xx + 1, yy + 1, txt, scale, scale, angle, c, c, c, c, alpha);

var c = argument3;

draw_text_transformed_color(xx, yy, txt, scale, scale, angle, c, c, c, c, alpha);