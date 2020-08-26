if (!place_meeting(x + hsp * 8, y, oCollisionPlayerOnly))
{
	//Negate momentum
	hsp = 0;
}

hsp = scrApproach(hsp, 0, 0.1);
x += hsp;

if (!place_meeting(x, y + vsp * 8, oCollisionPlayerOnly))
{
	//Negate momentumm
	vsp = 0;
}

vsp = scrApproach(vsp, 0, 0.1);
y += vsp;