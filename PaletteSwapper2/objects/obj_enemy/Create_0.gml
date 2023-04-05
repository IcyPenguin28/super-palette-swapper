/// @description Insert description here
// You can write your code in this editor

event_inherited();

// These can be changed in child objects
hpMax = 10;
atk = 1; // The number of HP wedges to remove from the player if they touch the enemy directly
def = 0; // The amount of damage that is protected against
grav = 0.1;
gAccel = 0.1;
aAccel = 0.1;

// Do not change these
hp = hpMax;
hpDisplayTime = 120;
hpDisplayStep = 0;
hsp = 0;
vsp = 0;
dir = 1;
inAttack = false;
