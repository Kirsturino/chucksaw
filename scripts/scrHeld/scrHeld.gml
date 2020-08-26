var hold = 1 - owner.holdTimer / holdTimeMax;

var shakeX = random_range(-hold * 20, hold * 20);
var shakeY = random_range(-hold * 20, hold * 20);

x = lerp(x, owner.heldX + shakeX, 0.4);
y = lerp(y, owner.heldY + shakeY, 0.4);

spinSpeed = hold * 20;