/// @description Insert description here
// You can write your code in this editor
grav = 0.1;
spd = 3;
dashSpd = 20;
gAccel = 0.1;
aAccel = 0.1;
jumpSpd = 3;

hsp = 0;
vsp = 0;
dir = 1;

enum state_breezepuff
{
	idle,
	attack
}

state = state_breezepuff.idle;