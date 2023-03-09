/// @description Insert description here
// You can write your code in this editor

event_inherited();

enum ST_Player
{
	zero = 0,
	
	neutral,
	walk,
	
	attack1,
	attack2,
	attack3,
	
	attackAir1,
	attackAir2,
	attackAir3,
}

// Debug
debug = 1;

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
gAccel = 0.15; // This is the rate at which the player speeds up/slows down when on normal ground
maxCombo = 3; // This is the number of hits the player can string together at once
maxIFrames = room_speed * 1; // Changing the int literal changes the number of seconds iframes are active.
hitStopFactor = 10; // The higher this number, the slower hitstop will last for
depth = -1;
airAttackDescent = 0.5; // Multiplied to gravity and vertical speed when attacking in the air

//Mutables
hsp = 0; // This is the player's instantaneous horizontal velocity
vsp = 0; // This is the player's instantaneous vertical velocity
dir = 0; // Can be either -1, 0, or 1. Determines the direction the player is facing.
lockdir = false;
numLives = 4; // This is the number of lives the player currently has
coyoteTime = 0;
jumpFrames = 5;
myCol = PlayerPaintColors.white; // This tracks which color the player currently has active.
maxHp = 4; // This is the number of hits the player can take before dying. Some attacks may deal more than 1 HP
hp = maxHp; // This tracks the player's current HP value.
iFrames = 0;
collectedBigDrops = [false, false, false]; // Bool array that holds the value for which big paintdrops in the stage have been collected.
numPaintdrops = 0; // Represents the number of paintdrops the player has collected in the current stage
attackState = -1; // This is the index of where the player is in the 3 hit combo

//Timers
dashstep = 0;
dashTime = 20;
shootstep = 0;
shootTime = 5;
bombTime = 20;

//Boolean states
isAttackingGround = false;	// Attack animation is in progress
isAttackingAir = false;	// Air attack animation is in progress
changeAttackState = false;	// Update attack state on Animation End

isHurt = false;
hasPaintBucket = false;

canMove = true;
canDash = true;
canAttack = true;
canJump = true;
canShoot = true;
hitStop = false;
isDashing = false;

//Animations
idleSprite = spr_andy_idle;

spriteanimator = new SpriteAnimator();
//spriteanimator.Layer(0).SetCallback(OnAnimationEnd);
spriteanimator.CopyAnimations_Struct(SPRITEANIMMAP[$ "andy"]);

image_speed = 0;

SetState(ST_Player.neutral);
