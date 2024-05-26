/// @desc 

// Inherit the parent event
event_inherited();

function Update(ts)
{
	inWater = place_meeting(x,y,obj_water);
	
	if (vsp >= 1)
	{
		bouncecount = 1;
	}
	
	switch(state)
	{
		// Sleep ======================================================
		case(ST_EN_Dropling.sleep):
			// Start cycle when in camera
			if ( InCamera(32) )
			{
				SetState(ST_EN_Dropling.walk);
			}
			break;
		
		// Hitstun ======================================================
		case(-ST_EN_Dropling.hurt):
			vsp = -4;
			break;
		
		case(ST_EN_Dropling.hurt):
			if (hitstopstep == 0)
			{
				SetState(ST_EN_Dropling.walk);
			}
			break;
		
		// Walk ======================================================
		case(-ST_EN_Dropling.walk):
			steptimer = waitdelay*ts * irandom_range(1, 2);	// walk for 1-2 seconds
			
			// Switch direction at random
			if ( irandom(1) )
			{
				image_xscale *= -1;
			}
			break;
		
		case(ST_EN_Dropling.walk):
			// Slow down hsp when over limit
			var _hspmax = 1.5; // Max horizontal speed
			var _hspdec = 0.05; // Controls how fast enemy returns to max speed once exceeded
		
			if (onGround)
			{
				image_angle = 0;
				steptimer = approach_value(steptimer, 0, ts);
				_hspmax = 0;
				
				// Turn if colliding with other enemy
				var e = instance_place(x+hsp, y, obj_enemy);
				if (e && (sign(e.x-x) == sign(hsp)))
				{
					image_xscale *= -1;
				}
			}
			else
			{
				image_angle -= airspinspeed * sign(image_xscale);
			}
			
			// Walk
			hsp = approach_value(hsp, walkspeed * sign(image_xscale), ts);
			
			if (abs(hsp) > abs(_hspmax))
			{
				hsp = lerp(hsp, _hspmax * sign(hsp), _hspdec*ts);
			}
		
			if (steptimer == 0)
			{
				SetState(ST_EN_Dropling.wait);
			}
			break;
	
		// Wait ======================================================
		case(-ST_EN_Dropling.wait):
			steptimer = waitdelay*ts * irandom_range(1, 3);	// Wait for 1-3 seconds
			break;
	
		case(ST_EN_Dropling.wait):
			// Slow down hsp when over limit
			var _hspmax = 1.5; // Max horizontal speed
			var _hspdec = 0.05; // Controls how fast enemy returns to max speed once exceeded
		
			if (onGround)
			{
				image_angle = 0;
				steptimer = approach_value(steptimer, 0, ts);
				_hspmax = 0;
			}
			else
			{
				image_angle += airspinspeed * sign(image_xscale);
			}
			
			if ( abs(hsp) > abs(_hspmax) )
			{
				hsp = lerp(hsp, _hspmax * sign(hsp), _hspdec*ts);
			}
		
			if (steptimer == 0)
			{
				SetState(ST_EN_Dropling.walk);
			}
			break;
	}

	// MOVEMENT
	if (hitstopstep > 0)
	{
		hitstopstep = approach_value(hitstopstep, 0, ts);
	}
	else
	{
		if (!onGround)
		{
			vsp += grav * ts;
		}
	
		x += hsp * ts;
		y += vsp * ts;
	}

	var _coll = ProcessCollision(false);
	onGround = _coll & FL_COLLISION_D;
	
	if (onGround && vsp >= 0)
	{
		if (bouncecount > 0)
		{
			bouncecount -= 1;
			vsp = -abs(vsp * 0.5);
			onGround = false;
		}
		else
		{
			vsp = 0;
		}
	}
	
	// Moving right + collision on right
	if ( hsp > 0 && (_coll & FL_COLLISION_R) )
	{
		image_xscale *= -1;
	}
	// Moving left + collision on left
	else if ( hsp < 0 && (_coll & FL_COLLISION_L) )
	{
		image_xscale *= -1;
	}
}

function OnDamage()
{
	hitstopstep = 7;
	self.flashTime = 10;
	hpDisplayStep = hpDisplayTime;
	SetState(ST_EN_Dropling.hurt);
	audio_play_sound(snd_hit, 0, false, global.gain_sfx);
}

