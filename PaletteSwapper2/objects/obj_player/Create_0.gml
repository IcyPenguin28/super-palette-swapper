/// @description Insert description here
// You can write your code in this editor

//Constants
spd = 3; // This is the player's base movement speed;
jumpSpd = 6; // Determines the jump height of the player.
grav = 0.25; // The higher this value, the faster the player falls. Neg vals means upside down gravity.
movSpd = spd; // This is used to return to the base movement speed after something changes the player's speed.
atkMovSpd = spd / 2; // This is the speed at which the player moves while in the attacking state.
dashSpd = spd * 2;
coyoteTimeMax = 6;
jumpFramesMax = 5;
maxPaintBullets = 3;

//Mutables
hsp = 0;
vsp = 0;
dir = 0;
combo = 0;
maxCombo = 3;
numLives = 4;
coyoteTime = 0;
jumpFrames = 5;
myCol = colors.white;

//Timers
dashstep = 0;
dashTime = 20;
shootstep = 0;
shootTime = 20;

//Boolean states
isAttackingGround = false;
isAttackingAir = false;
hasPaintBucket = false;
canDash = true;
isDashing = false;
canShoot = true;

//Animations
idleSprite = spr_andy_idle;
runSprite = spr_andy_run;
jumpSprite = spr_andy_jump;
groundAtkSprite = spr_andy_swipe_ground;
airAtkSprite = spr_andy_swipe_air;