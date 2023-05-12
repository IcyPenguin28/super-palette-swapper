/// @desc Unique Events

// Inherit the parent event
event_inherited();

function ProcessMovement(_hspeed, _vspeed)
{
	// UPDATING STATES  
	var coll = collision_line(x, y, x, bbox_bottom, obj_solid, 0, 1);
	onGround = (coll && sign(grav) == 1 ||
				place_meeting(x,y-1,obj_solid) && sign(grav) == -1);
	inWater = place_meeting(x,y,obj_water);
	canShoot = (instance_number(obj_paintbullet) < maxPaintBullets && shootstep == 0) && !instance_exists(obj_results) && !instance_exists(obj_textbox);
	canBomb = (instance_number(obj_paintbomb) < maxBombs && shootstep = 0) && !instance_exists(obj_results) && !instance_exists(obj_textbox);

	if onGround
	{
		if dashstep == 0 && !instance_exists(obj_results) && !instance_exists(obj_textbox)
		{
			canDash = true;
		}
	}
	
	if instance_exists(obj_results) || instance_exists(obj_textbox)
	{
		canDash = false;
		canShoot = false;
		canBomb = false;
		canMove = false;
		canJump = false;
	}
	else
	{
		canMove = true;
		canJump = true;
	}

	// MOVEMENT ----------------------------------------------------- 
	
	if ( !canMove )
	{
		keyRight = 0;
		keyLeft = 0;
	}
	
	dir = keyRight - keyLeft;
	if ( !isDashing )
	{
		hsp = lerp(hsp, dir * _hspeed, gAccel);
	}
	
	// Context dependent movement options
	if ( onGround ) //on ground
	{
		coyoteTime = coyoteTimeMax;
	}
	else if (inWater) //in water
	{

	}
	else //airborne
	{
		var _gravw = grav;	// Working Gravity. Real value unchanged
	
		// Slow descent if attacking in air
		if (isAttackingAir)
		{
			_gravw *= airAttackDescent;
		}
	
		if (!isDashing)
		{
			vsp += _gravw; //add gravity to player's vertical speed
		}
	
		// Aerial Combat
		if (canAttack && keyBrush && !isAttackingGround && !isAttackingAir)
		{
			_hspeed = atkMovSpd;
			isAttackingAir = true;
			image_index = 0;
		}
		else if (canAttack && keyBrush && !isAttackingGround && isAttackingAir)
		{
			changeAttackState = true;	
		}
	}

	//Coyote time
	if (coyoteTime > 0)
	{
	    coyoteTime--;
	}

	//Jump input buffering
	if (keyJump && canJump)
	{
	    jumpFrames = 0;
	}

	if (jumpFrames < jumpFramesMax)
	{
	    jumpFrames++;
	}

	//Jump
	if ((onGround || coyoteTime > 0) && jumpFrames < jumpFramesMax && !isDashing)
	{
		if sign(grav) == -1
		{
			vsp = jumpSpd;
		}
		else
		{
			vsp = -jumpSpd;
		}
	}
	
	// Timer for when the paintdrop pickup pitch resets
	// TODO: This does not appear to work
	if paintstep > 0
	{
		// show_debug_message(paintstep);
		paintstep --;
	}
	
	if paintstep == 0
	{
		// show_debug_message("Back to one");
		paintdropPitch = 1;
	}

	// Variable Jump Height
	if sign(grav) == 1
	{
		if (vsp < 0 && !keyJumpHeld)
		{
			vsp = max(vsp, -jumpSpd/3);
		}
	}
	else
	{
		if (vsp > 0 && !keyJumpHeld)
		{
			vsp = min(vsp, jumpSpd/3);
		}
	}
	
	// Shoot Timer
	if shootstep > 0
	{
		shootstep --;
	}

	//I-Frame Timer
	if iFrames > 0
	{
		image_alpha = iFrames % 2;
		iFrames --;
	}
	else
	{
		image_alpha = 1;
	}

	// Hitstop Timer
	if hitStop
	{
		room_speed /= hitStopFactor;
		hitStop = false;
	}
	else
	{
		var targetRmSpd = 60;
		if room_speed != targetRmSpd
		{
			room_speed *= hitStopFactor;
		}
	}
	
	// Vertical
	var _vspw = vsp;	// Working Speed

	// Slow speed if attacking in air
	if (isAttackingAir)
	{
		_vspw *= airAttackDescent;
	}
	
	x += hsp;
	y += _vspw;
	
	// Out of Bounds Respawn
	UpdateFallCheckpoint();
	
	if (instance_place(x, y, obj_fall))
	{
		// Do damage
		TakeDamage(1);
		
		// Respawn at last checkpoint
		if (fallcheckpoint)
		{
			hsp = 0;
			vsp = 0;
			x = fallcheckpoint.x;
			y = fallcheckpoint.y - 32;
		}
	}
}

function ProcessPowers()
{
	switch (myCol)
	{
		// RED
		case PlayerPaintColors.red:
			if (canDash && keyAction)
			{
				SetState(ST_Player.dash);
			}
			break;
		// ORANGE
		case PlayerPaintColors.orange:
			/*if (canShoot && keyBrush)
			{
				shootstep = shootTime;
				with instance_create_layer(x + sign(image_xscale), y, "Instances", obj_paintbullet)
				{
					dir = sign(other.image_xscale);
					grav = sign(other.grav) * grav;
				}
			}*/
			break;
		// YELLOW
		case PlayerPaintColors.yellow:
		if (canShoot && keyBrush)
			{
				shootstep = shootTime;
				with instance_create_layer(x + sign(image_xscale), y, "Instances", obj_paintglob_yellow)
				{
					dir = sign(other.image_xscale);
					grav = sign(other.grav) * grav;
				}
			}
			break;
		// GREEN
		case PlayerPaintColors.green:
			break;
		// CYAN
		case PlayerPaintColors.cyan:
			break;
		// BLUE
		case PlayerPaintColors.blue:
			if (canBomb & keyBrush && !keyDown) //Place
			{
				shootstep = bombTime;
				with instance_create_layer(x + sign(image_xscale), y, "Instances", obj_paintbomb)
				{
					dir = sign(other.image_xscale);
					grav = sign(other.grav) * grav;
				}
			}
			if (keyDown && keyBrush) //Detonate
				{
					if instance_exists(obj_paintbomb)
					{
						with (obj_paintbomb)
						{
							instance_destroy();
						}
					}
				}
			break;
		// INDIGO
		case PlayerPaintColors.indigo:
			break;
		// PURPLE
		case PlayerPaintColors.purple:
			break;
	}
}

function UpdateFallCheckpoint()
{
	// Find nearest checkpoint when on ground
	if (onGround)
	{
		var _inst = instance_nearest(x, y, obj_fallcheckpoint);
		
		if (_inst)
		{
			fallcheckpoint = _inst;
		}
	}
}

