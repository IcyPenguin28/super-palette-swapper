/// @desc Entity Functions
/*
	Functions shared by all entities.
	Override "Common" and "Callback" functions by redefining them after inheriting this event.
*/

#macro FL_COLLISION_R (1<<0)
#macro FL_COLLISION_U (1<<1)
#macro FL_COLLISION_L (1<<2)
#macro FL_COLLISION_D (1<<3)

// COMMON (Override OK) ======================================================

// Called on first frame of existance. This is NOT a replacement to the Create event.
function Start()
{
	
}

// Called every frame. Do not define in Step Event! (Doing so will set the function every frame)
/*
	Timestep Guide:
	Multiply "ts" value to result when adding to a **variable over time**.
		x += hsp * ts	// Add velocity over time
		y += vsp * ts	// Add velocity over time
		vsp += grav * ts	// Add gravity over time
		hsp = approach_value(hsp, maxspd * dir, acceleration*ts)	// Approach max speed over time
		hsp = approach_value(hsp, 0, deceleration*ts)	// Slow speed to 0 over time
		timer = max(0, timer-ts)	// Decrement timer over time
	Ignore "ts" value when doing instant changes
		vsp = jumpspd	// Immediate change to vertical speed
		hsp = 0	// Stop horizontal speed
*/
function Update(ts)
{
	
}

// Called in Draw event
function Draw()
{
	var _x = x;
	var _y = y;
	
	var _xhitstop = 2 * (((hitstopstep div 2) % 2)? 1:-1) * sqrt(abs(hitstopstep));

	draw_sprite_ext(
		sprite_index, 
		image_index,
		_x + _xhitstop,
		_y,
		image_xscale,
		image_yscale,
		image_angle,
		image_blend,
		image_alpha
		);

	if (hpDisplayStep > 0)
	{
		draw_healthbar(x - 8, y - (sprite_height/2 + 8), x + 8, y - (sprite_height/2 + 6), (hp / hpMax) * 100, c_black, c_red, c_lime, 0, true, false);
	}
	else
	{
	
	}
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

function TryStart()
{
	if (!trystart)
	{
		trystart = true;
		Start();
		OnStart();
		return true;
	}
	
	return false;
}

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

// CALLBACKS (Override OK)  ======================================================

function OnStart()
{
	
}

function OnDefeat()
{
	
}

function OnDamage()
{
	
}


