/// @description Insert description here
// You can write your code in this editor

// Inherit all parent variables
event_inherited();

// Child exclusive variables
grav = 0.1;
spd = 3;
dashSpd = 20;
jumpSpd = 3;

enum state_breezepuff
{
	idle,
	attack
}

state = state_breezepuff.idle;