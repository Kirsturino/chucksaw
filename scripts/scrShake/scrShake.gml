if (shakeDuration > 0)
{
	var amount = irandom_range(-shakeAmount, shakeAmount);
	shakeX = amount;
	amount = irandom_range(-shakeAmount, shakeAmount);
	shakeY = amount;
	
	shakeDuration--;
} else
{
	shakeX = 0;
	shakeY = 0;
}