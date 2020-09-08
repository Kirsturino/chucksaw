/// @description Keep track of some sort of momentum when held
if (state == scrHeld)
{
	previousDist = point_distance(x, y, previousX, previousY);

	if (previousDist > maxDist)
	{
		maxDist = previousDist;
		alarm[2] = flickBufferLength;
	}

	previousX = x;
	previousY = y;
}

alarm[0] = previousLength; 