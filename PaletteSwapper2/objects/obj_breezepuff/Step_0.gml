/// @description Insert description here
// You can write your code in this editor
#region UPDATING STATES
onGround = (place_meeting(x,y+1,obj_solid) && sign(grav) == 1 ||
			place_meeting(x,y-1,obj_solid) && sign(grav) == -1);
inWater = place_meeting(x,y,obj_water);
#endregion

#region MOVEMENT

//Context dependent movement options
if (onGround) //on ground
{
	if (state = state_breezepuff.idle)
	{
		hsp = 0;
		if alarm[0] == -1
		{
			alarm[0] = room_speed * 1;
		}
	}
	else if (state = state_breezepuff.attack)
	{
		hsp = 0;
		if alarm[0] == -1
		{
			alarm[0] = 1;
		}
	}
}
else if (inWater) //in water
{

}
else //airborne
{
	vsp += grav;
	
	if (vsp == 0) // At peak of jump
	{
		vsp = 0; // Stay airborne
		hsp = lerp(hsp, dashSpd * dir, aAccel);
		with instance_create_layer(x, y, "Instances", obj_breezepuff_projectile)
		{
			dir = -other.dir;
		}
	}
}

//Jump
if (onGround && state == state_breezepuff.attack)
{
	if sign(grav) == -1
	{
		vsp = jumpSpd;
	}
	else
	{
		vsp = -jumpSpd;
	}
}
#endregion

#region COLLISION
//Horizontal

// Slow down hsp when over limit
if (hsp > hspmax)
{
	hsp = lerp(hsp, hspmax, hspdamp);
}
else if (hsp < -hspmax)
{
	hsp = lerp(hsp, -hspmax, hspdamp);
}

if (place_meeting(x+hsp,y,obj_solid))
{
	while (!place_meeting(x+sign(hsp),y,obj_solid))
	{
		x += sign(hsp);
	}
	hsp = 0;
}
x += hsp;

//Vertical
if (place_meeting(x,y+vsp,obj_solid))
{
	while (!place_meeting(x,y+sign(vsp),obj_solid))
	{
		y += sign(vsp);
	}
	vsp = 0;
}
y += vsp;

#endregion