/// @description Insert description here
// You can write your code in this editor

//Constants
spd = 3;
jumpSpd = 6;
grav = 0.25;
coyoteTimeMax = 15;

//Mutables
hsp = 0;
vsp = 0;
dir = 0;
combo = 0;
maxCombo = 3;
numLives = 4;
coyoteTime = 0;

//Boolean states

//Animations
idleSprite = spr_andy_idle;
runSprite = spr_andy_run;
jumpSprite = spr_andy_jump;
groundAtkSprite = spr_andy_swipe_ground;
airAtkSprite = spr_andy_swipe_air;