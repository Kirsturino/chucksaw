///@desc Rotate camera
///@param amount
///@param randomized

var setRot = argument0;
var rand = argument1;
if (rand) setRot *= choose(-1, 1);

oCamera.rot = setRot;