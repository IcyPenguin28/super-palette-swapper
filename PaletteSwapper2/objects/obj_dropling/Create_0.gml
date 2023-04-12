/// @desc 

// Inherit the parent event
event_inherited();

enum ST_EN_Dropling
{
	zero,
	
	sleep,
	walk,
	wait,
	hurt,
}

grav = 0.15;
walkspeed = 0.5;
steptimer = 0;
airspinspeed = 5;
waitdelay = irandom_range(50, 60);	// Wait interval to switch states
bouncecount = 0;

SetState(ST_EN_Dropling.sleep);

