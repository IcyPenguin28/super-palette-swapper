/// @description Insert description here
// You can write your code in this editor
hsp = spd * dir;
vsp += grav;

onGround = (place_meeting(x, y+1, obj_solid) && sign(grav) == 1 ||
			place_meeting(x, y-1, obj_solid) && sign(grav) == -1);

//Vertical collision
if (place_meeting(x,y+vsp,obj_solid))
{
	while (!place_meeting(x,y+sign(vsp),obj_solid))
	{
		y += sign(vsp);	
	}
	vsp = 0;
}
y += vsp;

//Horizontal collision
if (place_meeting(x+hsp,y,obj_solid))
{
	while (!place_meeting(x+sign(hsp),y,obj_solid))
	{
		x += sign(hsp);	
	}
	dir *= -1;
}
x += hsp;

// Destroy themselves if they fall off-cam
var c = obj_camera;
if (instance_exists(c))
{
	
	if (x < c.camX || x > c.camX + c.camW || y < c.camY || y > c.camY + c.camH)
	{
		instance_destroy();
	}
}

if onGround
{
	if spd > 0
	{
		spd -= fric;
	}
	else
	{
		spd = 0;
	}
}