/// @description Insert description here
// You can write your code in this editor

event_inherited();

maxHP = 100;
hp = maxHP;

enum ST_Boss
{
	inactive,	// The boss's state when on the stage but shouldn't be doing anything
	prefight,	// Handles all of the fancy GFX and stuff when the fight starts, boss can't do anything
	idle,		// Boss is standing and doing nothing
	walk,		// Boss is moving
	jump,		// Boss is jumping
	attack1,	// One of the boss's attacks
	attack2,	// Another one of the boss's attacks
	attack3		// What do you think?
}

state = ST_Boss.inactive;

displayHP = false;

fightMusic = mus_boss_rival;

idleSprite = spr_vince_idle;
walkingSprite = spr_vince_move_b;
jumpingSprite = spr_vince_jump;

walkSpd = 4;

statestep = 0;

// The scene to check for to enter prefight state
myPreBossScene = scene_preboss1;

// The scene to play after boss defeat
myPostBossScene = scene_postboss1;

// To set in room editor: they are the walls that prevent the player from leaving the boss arena
proceedingWallB = noone;	// The one behind the player that should get added on prefight state
							// Usually occupies same space as the preboss scene trigger
proceedingWallF = noone;	// The one in front of the player that prevents them from moving forward until they defeat the boss

// Read jump points
// Copied straight from Hunter, sorry not sorry
var _inst;
numjumppoints = instance_number(obj_bossjumppoint);
jumpPoints = array_create(numjumppoints);
jumpstartpos = [0, 0];
jumptargetpos = [0, 0];

for (var i = 0; i < numjumppoints; i++)
{
	_inst = instance_find(obj_bossjumppoint, i);
	jumpPoints[i] = [_inst.x, _inst.y-(bbox_bottom-y)];	// Account for sprite offset
}


// TODO: Populate with default values or populate with values only in child objects
enum Boss_StateDurations
{
	idle = 50,
	walk = 90,
	jump,
	attack1,
	attack2,
	attack3
}

