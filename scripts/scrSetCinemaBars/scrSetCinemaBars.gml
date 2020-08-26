///@description set position for cinematic bars
///@param rotation
///@param zoom
///@param speed
///@param color

var rot = argument0;
var zoom = argument1;
var spd = argument2;
var c = argument3;

with (oCinemaBars)
{
	topBarRotTo = rot;
	botBarRotTo = -rot;
	
	topBarYChange = zoom;
	botBarYChange = -zoom;
	
	lerpSpeed = spd;
	
	global.barColor = c;
}