/// @description Insert description here
// You can write your code in this editor

//Constants
spd = 3; // This is the player's base movement speed;
jumpSpd = 6; // Determines the jump height of the player.
grav = 0.25; // The higher this value, the faster the player falls. Neg vals means upside down gravity.
movSpd = spd; // This is used to return to the base movement speed after something changes the player's speed.
atkMovSpd = spd / 2; // This is the speed at which the player moves while in the attacking state.
dashSpd = spd * 2; // This is the speed at which the player moves while dashing
coyoteTimeMax = 6; // This is the number of frames coyote time lasts for
jumpFramesMax = 5; // This is the number of frames jump input buffering lasts for
maxPaintBullets = 3; // This is the number of orange bullets that can be on the screen at once
maxBombs = 2; // This is the number of bombs that can be on the screen at once
gAccel = 0.2; // This is the rate at which the player speeds up/slows down when on normal ground
maxCombo = 3; // This is the number of hits the player can string together at once

//Mutables
hsp = 0; // This is the player's instantaneous horizontal velocity
vsp = 0; // This is the player's instantaneous vertical velocity
dir = 0; // Can be either -1, 0, or 1. Determines the direction the player is facing.
combo = 0; // Tracks which stage of the 3-hit combo the player is on
numLives = 4; // This is the number of lives the player currently has
coyoteTime = 0;
jumpFrames = 5;
myCol = colors.white; // This tracks which color the player currently has active.

//Timers
dashstep = 0;
dashTime = 20;
shootstep = 0;
shootTime = 5;
bombTime = 20;

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