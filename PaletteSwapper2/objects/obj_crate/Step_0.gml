/// @description Insert description here
// You can write your code in this editor



// Inherit the parent event
event_inherited();

ProcessCollision();

var coll = collision_line(x, y, x, bbox_bottom, [obj_solid, obj_crate, obj_semisolid], 0, 1);
onGround = (coll && sign(grav) == 1);

if !onGround
{
	vsp += grav;
}
else
{
	vsp = 0;
}

y += vsp;