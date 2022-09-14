/// @description Insert description here
// You can write your code in this editor
hsp = spd * dir;
vsp += grav;

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
