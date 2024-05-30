/// @description Insert description here
// You can write your code in this editor



// Inherit the parent event
event_inherited();
var ts = obj_globalcontroller.timestepLevel;	// Timestep. Set to 0 when game is paused, global hitstop, etc.


// Both = circle. Place instance in level at top of circle.
if oscX
{
	x += cos(freqX * hoverTimer * ts) * ampX;
}

if oscY
{
	y += sin(freqY * hoverTimer * ts) * ampY;
}
hoverTimer ++;
