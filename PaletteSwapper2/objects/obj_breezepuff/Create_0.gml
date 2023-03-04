/// @description Insert description here
// You can write your code in this editor

// Inherit all parent variables
event_inherited();

// Child exclusive variables
grav = 0.1;
spd = 3;
dashSpd = 20;
jumpSpd = 3;
hspmax = 3;	// Max horizontal speed
hspdamp = 0.14; // Controls how fast enemy returns to max speed once exceeded

enum state_breezepuff
{
	idle,
	attack
}

state = state_breezepuff.idle;