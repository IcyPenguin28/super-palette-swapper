/// @description Insert description here
// You can write your code in this editor
hp = 100;

selectionTimer = 120;

enum ST_Boss
{
	idle,
	walk,
	jump,
	attack1,	// One of the boss's attacks
	attack2		// The other one of the boss's attacks
}

state = ST_Boss.idle;