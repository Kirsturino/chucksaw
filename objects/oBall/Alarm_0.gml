/// @description Keep track of some sort of momentum when held
previousDist = point_distance(x, y, previousX, previousY);

previousX = x;
previousY = y;

alarm[0] = previousLength; 