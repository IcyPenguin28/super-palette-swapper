/// @desc Entity Functions
/*
	Functions shared by all entities.
	Override "Common" and "Callback" functions by redefining them after inheriting this event.
*/

#macro FL_COLLISION_R (1<<0)
#macro FL_COLLISION_U (1<<1)
#macro FL_COLLISION_L (1<<2)
#macro FL_COLLISION_D (1<<3)
#macro FL_COLLISION_LD (1<<4)
#macro FL_COLLISION_RD (1<<5)

#macro KB_ANGLE_AWAY 361
#macro KB_ANGLE_TOWARD 362

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
function ProcessCollision(update_speeds=true)
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
		if (update_speeds)
		{
			vsp = max(vsp, 0);
		}
		
		_outbits |= FL_COLLISION_U;
	}
	
	// Down
	c = collision_line(x, y, x, bbox_bottom, obj_solid, 0, 1);
	if (c)
	{
		y = c.bbox_top - (bbox_bottom-y);
		if (update_speeds) 
		{
			vsp = min(vsp, 0);
		}
		
		_outbits |= FL_COLLISION_D;
	}
	
	// Down Right
	c = collision_line(bbox_right, y, bbox_right, bbox_bottom, obj_solid, 0, 1);
	if (c)
	{
		_outbits |= FL_COLLISION_RD;
	}
	
	// Down Left
	c = collision_line(bbox_left, y, bbox_left, bbox_bottom, obj_solid, 0, 1);
	if (c)
	{
		_outbits |= FL_COLLISION_LD;
	}
	
	// Horizontal ----------------------------------------------
	
	// Moving Right
	c = collision_line(x, y-_hsep, bbox_right, y-_hsep, obj_solid, 0, 1);
	if (c)
	{
		x = c.bbox_left - (bbox_right-x);
		if (update_speeds)
		{
			hsp = min(hsp, 0);
		}
		
		_outbits |= FL_COLLISION_R;
	}
	
	c = collision_line(x, y+_hsep, bbox_right, y+_hsep, obj_solid, 0, 1);
	if (c)
	{
		x = c.bbox_left - (bbox_right-x);
		if (update_speeds)
		{
			hsp = min(hsp, 0);
		}
		
		_outbits |= FL_COLLISION_R;
	}
	
	// Left
	c = collision_line(x, y-_hsep, bbox_left, y-_hsep, obj_solid, 0, 1);
	if (c)
	{
		x = c.bbox_right - (bbox_left-x);
		if (update_speeds)
		{
			hsp = max(hsp, 0);
		}
		
		_outbits |= FL_COLLISION_L;
	}
	
	c = collision_line(x, y+_hsep, bbox_left, y+_hsep, obj_solid, 0, 1);
	if (c)
	{
		x = c.bbox_right - (bbox_left-x);
		if (update_speeds)
		{
			hsp = max(hsp, 0);
		}
		
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

// INTERACTIONS ============================================================

/*
	Common damage block (order is important):
	{
		target.RehitAppend(self, 30);	// Prevent rehits for 30 frames
		target.TakeKnockback(2, 45, self)	// Deal knockback
		target.TakeDamage(damage, self)	// Deal damage
	}
*/

function RehitUpdate(ts)
{
	for (var i = 0; i < rehitqueuecount; i++)
	{
		if ( rehitqueuetimer[i] != 0 )
		{
			if (rehitqueuetimer[i] < 0)
			{
				rehitqueuetimer[i] *= -1;
			}
			
			rehitqueuetimer[i] = max(0, rehitqueuetimer[i]-ts);
			
			if (rehitqueuetimer[i] == 0)
			{
				rehitqueuetimer[i] = 0;
				rehitqueueinst[i] = noone;
			}
		}
	}
}

function RehitContains(inst)
{
	for (var i = 0; i < rehitqueuecount; i++)
	{
		if ( rehitqueueinst[i] == inst && rehitqueuetimer[i] > 0 )
		{
			return true;
		}
	}
	
	return false;
}

function RehitAppend(inst, rehit_timer)
{
	rehitqueueinst[rehitqueueindex] = inst;
	rehitqueuetimer[rehitqueueindex] = -rehit_timer;
	rehitqueueindex = (rehitqueueindex+1) % rehitqueuecount;
}

function TakeDamage(damage, attackerinst=noone)
{
	// Skip if attacker is in rehit queue
	if (attackerinst)
	{
		if (RehitContains(attackerinst))
		{
			return 0;
		}
	}
	
	// show_debug_message(string([object_get_name(attackerinst.object_index), damage]));

	
	damage = max(0, damage-def);
	
	hp = max(0, hp-damage);
	
	OnDamage(damage, attackerinst);
	
	if (hp == 0)
	{
		Defeat();
		return 0;
	}
	
	return 1;
}

// Assumes facing right. Flips X if absolute_direction is not set
/*
	Direction value assumes target is right of attacker. Flips X based on position when inst value is provided.
	dir = 0: Send right when attacking from left, send left when attacking from right
														...[dir=45]
			>>PROJECTILE>>  ..>	..>	..>   [TARGET]...			...[dir=0]
														...[dir=315]
*/
function TakeKnockback(kb_strength, kb_direction=45, attackerinst=noone, force_speed=false)
{
	// Skip if attacker is in rehit queue
	if (attackerinst)
	{
		if (RehitContains(attackerinst))
		{
			return;
		}
		
		// Move away from attacker
		if (kb_direction == KB_ANGLE_AWAY)
		{
			kb_direction = point_direction(x, y, attackerinst.x, attackerinst.y);
		}
		// Move towards attacker
		else if (kb_direction == KB_ANGLE_TOWARD)
		{
			kb_direction = point_direction(attackerinst.x, attackerinst.y, x, y);
		}
	}
	
	kb_strength = max(0, kb_strength-kbres);
	
	var _kbx = lengthdir_x(kb_strength, kb_direction);
	var _kby = lengthdir_y(kb_strength, kb_direction);
	
	if (attackerinst && (kb_direction < 360))
	{
		_kbx *= (attackerinst.x < x)? 1: -1;	// 1 if attacker is left of target, -1 if to the right
		//_kbx *= sign(attackerinst.image_xscale);	// Knockback sign based on attacker x_scale
	}
	
	// Set speed to knockback
	if (force_speed)
	{
		hsp = _kbx;
		vsp = _kby;
	}
	// Add knockback to value
	else
	{
		hsp += _kbx;
		vsp += _kby;
	}
}

// Alternative function using x and y instead of direction
function TakeKnockbackXY(kb_strength, kb_x, kb_y, attackerinst=noone, force_speed=false)
{
	return TakeKnockback(
		kb_strength,
		point_direction(0,0, kb_x, kb_y),
		attackerinst,
		force_speed
		);
}

function Defeat()
{
	// Destroy instance if OnDefeat returns anything but 0 or undefined
	if ( !OnDefeat() )
	{
		instance_destroy();
	}
}

// CALLBACKS (Override OK)  ======================================================

function OnStart()
{
	
}

// Return 0 (default) to destroy instance afterwards, 1 to prevent destroy
function OnDefeat()
{
	return 0;
}

function OnDamage(damage, inst=noone)
{
	hpDisplayStep = hpDisplayTime;
}

function InCamera(border=0)
{
	var cam = obj_camera;
	return collision_rectangle(
		cam.location[0]-border,
		cam.location[1]-border,
		cam.location[0]+cam.wRes+border,
		cam.location[1]+cam.hRes+border,
		self, false, false
		);
}
