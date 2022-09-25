/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

onGround = (place_meeting(x,y+1,obj_solid) && sign(grav) == 1 ||
			place_meeting(x,y-1,obj_solid) && sign(grav) == -1);

if onGround
{
	// TODO: Check for ceiling code here
	// if there is a ceiling above the point of impact, then...
	with (instance_create_layer(x, y, "Instances", obj_puddle_yellow))
	{
		image_yscale = sign(other.grav);
	}
	instance_destroy();
}