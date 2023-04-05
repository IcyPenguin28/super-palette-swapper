/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

onGround = (place_meeting(x,y+1,obj_solid) && sign(grav) == 1 ||
			place_meeting(x,y-1,obj_solid) && sign(grav) == -1);

if onGround
{
	instance_destroy();
	return;
}

// Deal damage to enemy
var e = instance_place(x, y, obj_enemy);

if (e)
{
	e.RehitAppend(self, 30);
	e.TakeKnockback(kbx, 0, self);
	e.TakeDamage(atk, self);
	
	instance_destroy();
	return;
}

