/// @desc Entity Functions
/*
	Functions shared by all entities
*/


// COMMON ======================================================

// Called on first frame of existance
function Start()
{
	
}

// STATE ======================================================

/*
	States are positive integer values.
	Negative value means the current frame is the first frame of this state.
*/

function SetState(_state)
{
	state = -abs(_state);
	event_perform(ev_step, ev_step_normal);
	state = abs(state);
}

function IsStateStart()
{
	return state < 0;
}

// ANIMATION ===================================================
function InitAnimator(_animationsetkey)
{
	spriteanimator = new SpriteAnimator(1);
	spriteanimator.CopyAnimations_Struct(SPRITEANIMMAP[$ _animationsetkey]);
}

function SetAnimationKey(_key)
{
	spriteanimator.SetAnimationKey(_key);
}

function QueueAnimationKey(_key)
{
	spriteanimator.QueueAnimationKey(_key);
}

function UpdateAnimator(ts=1)
{
	if (spriteanimator)
	{
		spriteanimator.UpdateAnimator(ts);
	}
}


