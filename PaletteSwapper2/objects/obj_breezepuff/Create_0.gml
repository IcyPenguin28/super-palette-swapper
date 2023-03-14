/// @description Insert description here
// You can write your code in this editor

// Inherit all parent variables
event_inherited();

// Child exclusive variables
grav = 0.1;
spd = 3;
dashSpd = 20;
jumpSpd = 3;
kbres = 1;
onGround = false;

steptimer = 0;
jumpcount = 0;

enum ST_EN_BreezePuff
{
	zero,
	idle,
	hostile,
	attackrise,
	attackfall,
	hurt,
}

SetState(ST_EN_BreezePuff.hostile);

