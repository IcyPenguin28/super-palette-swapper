/// @description Insert description here
// You can write your code in this editor

event_inherited();

// These can be changed in child objects
maxhp = 10;
kbres = 0; // The amount of knockback that is protected against (in pixels)
atk = 1; // The number of HP wedges to remove from the player if they touch the enemy directly
def = 0; // The amount of damage that is protected against
grav = 0.1;
gAccel = 0.1;
aAccel = 0.1;

// Do not change these
hp = maxhp;
hpDisplayTime = 120;
hpDisplayStep = 0;
hsp = 0;
vsp = 0;
dir = 1;
inAttack = false;

knockbackDamp = 0;
knockbackSide = 0;	// +1/-1

lastprojectile = noone;	// Last instance that enemy has been hit by. Reset this to allow re-hits.

