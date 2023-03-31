/// @desc 

// Inherit the parent event
event_inherited();

function Update(ts)
{
	inWater = place_meeting(x,y,obj_water);

	switch(state)
	{
		// Hitstun ======================================================
		case(-ST_EN_BreezePuff.hurt):
			steptimer = 60*ts;
			vsp = -4;
			break;
	
		case(ST_EN_BreezePuff.hurt):
			if (hitstopstep == 0)
			{
				SetState(ST_EN_BreezePuff.hostile);
			}
			break;
	
		// Hostile ======================================================
		case(-ST_EN_BreezePuff.hostile):
			steptimer = 60*ts;
			jumpcount = 2;
			break;
	
		case(ST_EN_BreezePuff.hostile):
			// Slow down hsp when over limit
			var _hspmax = 0.5; // Max horizontal speed
			var _hspdamp = 0.1; // Controls how fast enemy returns to max speed once exceeded
		
			if (onGround)
			{
				steptimer = approach_value(steptimer, 0, ts);
				_hspmax = 0;
			}
		
			if (hsp > _hspmax)
			{
				hsp = lerp(hsp, _hspmax, _hspdamp * ts);
			}
			else if (hsp < -_hspmax)
			{
				hsp = lerp(hsp, -_hspmax, _hspdamp * ts);
			}
		
			if (steptimer == 0)
			{
				SetState(ST_EN_BreezePuff.attackrise);
			}
			break;
	
		// Attack Rise ======================================================
		case(-ST_EN_BreezePuff.attackrise):
			vsp = -jumpSpd * sign(grav);
			hsp = 0;
			jumpcount -= 1;
			break;
	
		case(ST_EN_BreezePuff.attackrise):
			if (vsp >= 0)
			{
				// Schut
				hsp = lerp(hsp, dashSpd * dir, aAccel);
				with instance_create_layer(x, y, "Instances", obj_breezepuff_projectile)
				{
					dir = -other.dir;
				}
			
				SetState(ST_EN_BreezePuff.attackfall);
			}
			break;
	
		// Attack Fall ======================================================
		case(-ST_EN_BreezePuff.attackfall):
			break;
	
		case(ST_EN_BreezePuff.attackfall):
			if (onGround)
			{
				// Jump again
				if (jumpcount > 0)
				{
					SetState(ST_EN_BreezePuff.attackrise);
				}
				// Switch dir and return to wait state
				else
				{
					dir = -dir;
					hsp = 0;
					SetState(ST_EN_BreezePuff.hostile);
				}
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

	var _coll = ProcessCollision();
	onGround = _coll & FL_COLLISION_D;


}

function OnHit()
{
	hitstopstep = 7;
	SetState(ST_EN_BreezePuff.hurt);
}

