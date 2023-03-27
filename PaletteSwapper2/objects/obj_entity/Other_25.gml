/// @desc Entity Functions
/*
	Functions shared by all entities
*/


// COMMON ======================================================

// Called on first frame of existance
function Start()
{
	
}

#macro FL_COLLISION_R (1<<0)
#macro FL_COLLISION_U (1<<1)
#macro FL_COLLISION_L (1<<2)
#macro FL_COLLISION_D (1<<3)

// Handles physics with the world. Call after ProcessMovement().
// Returns bitfield representing collisions
function ProcessCollision()
{
	var _outbits = 0;
	
	var c;
	var _hsep = sprite_get_height(mask_index) / 3;	// Space between horizontal collision lines
	
	// Vertical --------------------------------------------
	
	// Up
	c = collision_line(x, y, x, bbox_top, obj_solid, 0, 1);
	if (c)
	{
		y = c.bbox_bottom + (y-bbox_top);
		vsp = max(vsp, 0);
		
		_outbits |= FL_COLLISION_U;
	}
	
	// Down
	c = collision_line(x, y, x, bbox_bottom, obj_solid, 0, 1);
	if (c)
	{
		y = c.bbox_top - (bbox_bottom-y);
		vsp = min(vsp, 0);
		
		_outbits |= FL_COLLISION_D;
	}
	
	// Horizontal ----------------------------------------------
	
	// Moving Right
	c = collision_line(x, y-_hsep, bbox_right, y-_hsep, obj_solid, 0, 1);
	if (c)
	{
		x = c.bbox_left - (bbox_right-x);
		hsp = min(hsp, 0);
		
		_outbits |= FL_COLLISION_R;
	}
	
	c = collision_line(x, y+_hsep, bbox_right, y+_hsep, obj_solid, 0, 1);
	if (c)
	{
		x = c.bbox_left - (bbox_right-x);
		hsp = min(hsp, 0);
		
		_outbits |= FL_COLLISION_R;
	}
	
	// Left
	c = collision_line(x, y-_hsep, bbox_left, y-_hsep, obj_solid, 0, 1);
	if (c)
	{
		x = c.bbox_right - (bbox_left-x);
		hsp = max(hsp, 0);
		
		_outbits |= FL_COLLISION_L;
	}
	
	c = collision_line(x, y+_hsep, bbox_left, y+_hsep, obj_solid, 0, 1);
	if (c)
	{
		x = c.bbox_right - (bbox_left-x);
		hsp = max(hsp, 0);
		
		_outbits |= FL_COLLISION_L;
	}
	
	return _outbits;
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

// CALLBACKS ======================================================

function OnStart()
{
	
}

function OnDefeat()
{
	
}

function OnHit()
{
	
}


