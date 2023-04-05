/// @desc Start() Update() Draw()

event_inherited();

function Start()
{
	
}

// Called every frame
function Update(ts)
{
	#region CONTROLS
	var gp = global.gp_device;
	if gp != -1
	{
		keyLeft = keyboard_check(vk_left) ||
			abs(min(0,gamepad_axis_value(gp, gp_axislh)));
		keyRight = keyboard_check(vk_right) ||
			max(0,gamepad_axis_value(gp, gp_axislh));
		keyUp = keyboard_check(vk_up) ||
			abs(min(0,gamepad_axis_value(gp, gp_axislv)));
		keyDown = keyboard_check(vk_down) ||
			max(0,gamepad_axis_value(gp, gp_axislv));
		keyJump = keyboard_check_pressed(ord("Z")) ||
			gamepad_button_check_pressed(gp, gp_face1);
		keyJumpHeld = keyboard_check(ord("Z")) ||
			gamepad_button_check(gp, gp_face1);
		keyBrush = keyboard_check_pressed(ord("X")) ||
			gamepad_button_check_pressed(gp, gp_face3) ||
			gamepad_button_check_pressed(gp, gp_face4);
		keyAction = keyboard_check_pressed(ord("C")) ||
			gamepad_button_check_pressed(gp, gp_face2);
	
		keyReset = keyboard_check_pressed(ord("R"));
	}
	else
	{
		keyLeft = keyboard_check(vk_left);
		keyRight = keyboard_check(vk_right);
		keyUp = keyboard_check(vk_up);
		keyDown = keyboard_check(vk_down);
		keyJump = keyboard_check_pressed(ord("Z"));
		keyJumpHeld = keyboard_check(ord("Z"));
		keyBrush = keyboard_check_pressed(ord("X"));
		keyAction = keyboard_check_pressed(ord("C"));
	
		keyReset = keyboard_check_pressed(ord("R"));
	}
	#endregion

	switch(state)
	{
		default:
			show_debug_message("Illegal state: {0}", state);
			SetState(1);
			break;
	
		// Neutral =====================================================
		case(-ST_Player.neutral):	// State Start
			spriteanimator.SetAnimationKey("idle").UpdateAnimation(0);
			isAttackingGround = false;
			isAttackingAir = false;
			lockdir = false;
			isDashing = false;
			break;
	
		case(ST_Player.neutral):	// State Update
			// Ground Combat
			if (canAttack && keyBrush)
			{
				spd = atkMovSpd;
				isAttackingGround = true;
			
				SetState(ST_Player.attack1);
			}
			
			ProcessPowers();
			ProcessMovement(movSpd, 0);
			ProcessCollision();
		
			spriteanimator.UpdateAnimation(ts);
			break;
	
		// Attacks =====================================================
		case(-ST_Player.attack1):
			changeAttackState = false;
			lockdir = true;
			spriteanimator.SetAnimationKey("attack1a");
		
			OnAttack();
			break;
	
		case(-ST_Player.attack2):
			changeAttackState = false;
			lockdir = true;
			spriteanimator.SetAnimationKey("attack2a");
		
			OnAttack();
			break;
	
		case(-ST_Player.attack3):
			changeAttackState = false;
			lockdir = true;
			spriteanimator.SetAnimationKey("attack3a");
		
			OnAttack();
			break;
	
		case(ST_Player.attack1):
		case(ST_Player.attack2):
		case(ST_Player.attack3):
			ProcessMovement(atkMovSpd, 0);
		
			isAttackingAir = !onGround;
			
			ProcessCollision();
		
			spriteanimator.UpdateAnimation(ts);
		
			if ( keyBrush )
			{
				changeAttackState = true;
			}
		
			if ( spriteanimator.Layer(0).HasCompleted() )
			{
				SetState(ST_Player.neutral);
			}
			else if ( state != ST_Player.attack3 && spriteanimator.Layer(0).FrameElapsed(10) && changeAttackState )
			{
				SetState(state+1);
			}
			break;
		
		// Dashing =====================================================
		case(-ST_Player.dash):
			spriteanimator.SetAnimationKey("dash");
			lockdir = true;
			canDash = false;
			isDashing = true;
			dashstep = dashTime;
			
			if (dir != 0)
			{
				dashDir = dir;
			}
			else
			{
				dashDir = sign(image_xscale);
			}
				
			break;
		
		case(ST_Player.dash):
			vsp = 0;
			hsp = dashSpd * dashDir;
			ProcessMovement(hsp, vsp);
			ProcessCollision();
			
			// Dash Timer
			if dashstep > 0
			{
				dashstep = max(0, dashstep-ts);
				
				if dashstep == 0 // Countdown is complete
				{
					SetState(ST_Player.neutral);
				}
			}
			break;
	}

	// Defeat
	if hp <= 0
	{
		hitStop = false;
		instance_destroy();
	}

	// Update Direction
	if (dir != 0 && !lockdir)
	{
		image_xscale = sign(dir);
	}

	image_yscale = sign(grav);
}

function Draw()
{
	spriteanimator.DrawLayers(x, y, c_white, image_alpha, image_xscale, image_yscale, 0);
	//draw_self();
	pal_swap_set(spr_andy_palette,myCol - 1,false);

	// Collision Debugging
	if (DEBUG)
	{
		draw_line_color(x, y-8, bbox_left, y-8, c_orange, c_orange);
		draw_line_color(x, y-8, bbox_right, y-8, c_orange, c_orange);
	
		draw_line_color(x, y+8, bbox_left, y+8, c_orange, c_orange);
		draw_line_color(x, y+8, bbox_right, y+8, c_orange, c_orange);
	
		draw_line_color(x, y, x, bbox_top, c_olive, c_olive);
		draw_line_color(x, y, x, bbox_bottom, c_olive, c_olive);
	}
}

// Interaction ===================================================================

P_TakeDamage = TakeDamage;	// Keep reference to parent function
function TakeDamage(damage, attacker=noone)
{
	if (iFrames == 0)
	{
		return P_TakeDamage(damage, attacker);
	}
	
	return false;
}


// Callbacks ===================================================================

function OnAnimationEnd()
{
	// Attack animation is in progress (just finished)
	if (isAttackingGround)
	{
		// Next attack is queued (by buffering attack key)
		if (changeAttackState)
		{
			// Increment to 3 swipes total
			if (attackState < 2)
			{
				attackState ++;
			}
			// Reset on 3
			else
			{
				attackState = -1;
			}
			changeAttackState = false;
		}
		// No attack is queued. Reset appropriate values
		else
		{
			attackState = -1;
			isAttackingGround = false;
			spd = movSpd;
			
			//sprite_index = spr_andy_idle;
			image_index = 0;
		}
	}

	if (isAttackingAir)
	{
		// Next attack is queued (by buffering attack key)
		if (changeAttackState)
		{
			// Increment to 3 swipes total
			if (attackState < 2)
			{
				attackState ++;
			}
			// Reset to on 3
			else
			{
				attackState = -1;
			}
			changeAttackState = false;
		}
		// No attack is queued. Reset appropriate values
		else
		{
			attackState = -1;
			isAttackingAir = false;
			spd = movSpd;
			
			//sprite_index = spr_andy_idle;
			image_index = 0;
		}
	}
	
	spriteanimator.UpdateAnimation(0);
}

// Called when swipe attack occurs
function OnAttack()
{
	switch( myCol )
	{
		// White/Red Paint - Simple swipe
		case(PlayerPaintColors.white):
		case(PlayerPaintColors.red):
			with (instance_create_layer(x + sprite_width, y, "Instances", obj_attacktrail))
			{
				image_xscale = other.image_xscale;
				image_blend = obj_palette.colorDrawColor[other.myCol];
			}
			break;
		case(PlayerPaintColors.orange):
			instance_create_layer(x + sprite_width, y, "Instances", obj_paintbullet);
			break;
	}
}

function OnDamage()
{
	iFrames = maxIFrames;
	hitStop = true;
}