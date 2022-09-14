/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

onGround = place_meeting(x,y+1,obj_solid);

if onGround
{
	instance_destroy();
}