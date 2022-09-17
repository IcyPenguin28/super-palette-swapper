/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

onGround = (place_meeting(x,y+1,obj_solid) && sign(grav) == 1 ||
			place_meeting(x,y-1,obj_solid) && sign(grav) == -1);

if onGround
{
	instance_destroy();
}