/// @desc 

// Inherit the parent event
event_inherited();

kbres = 10;
walkSpd = 1;

dustTimer = 8;

spriteanimator = new SpriteAnimator();
//spriteanimator.Layer(0).SetCallback(OnAnimationEnd);
spriteanimator.CopyAnimations_Struct(SPRITEANIMMAP[$ "vince"]);
spriteanimator.SetAnimationKey("idle");

enum ST_Boss_Vince
{
	inactive,	// The boss's state when on the stage but shouldn't be doing anything
	prefight,	// Handles all of the fancy GFX and stuff when the fight starts, boss can't do anything
	idle,		// Boss is standing and doing nothing
	walk,		// Boss is moving
	jump,		// Boss is jumping
	attack1,	// One of the boss's attacks
	attack2,	// Another one of the boss's attacks
	attack3,	// What do you think?
	
	defeat,
}

