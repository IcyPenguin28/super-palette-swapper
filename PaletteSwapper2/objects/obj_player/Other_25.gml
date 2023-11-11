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
		keyLeft = keyboard_check(global.key_left) ||
			gamepad_button_check(gp, global.gp_left) ||
			abs(min(0,gamepad_axis_value(gp, gp_axislh)));
		keyRight = keyboard_check(global.key_right) ||
			gamepad_button_check(gp, global.gp_right) ||
			max(0,gamepad_axis_value(gp, gp_axislh));
		keyUp = keyboard_check(global.key_up) ||
			gamepad_button_check(gp, global.gp_up) ||
			abs(min(0,gamepad_axis_value(gp, gp_axislv)));
		keyDown = keyboard_check(global.key_down) ||
			gamepad_button_check(gp, global.gp_down) ||
			max(0,gamepad_axis_value(gp, gp_axislv));
		keyJump = keyboard_check_pressed(global.key_jump) ||
			gamepad_button_check_pressed(gp, global.gp_jump);
		keyJumpHeld = keyboard_check(global.key_jump) ||
			gamepad_button_check(gp, global.gp_jump);
		keyBrush = keyboard_check_pressed(global.key_brush) ||
			gamepad_button_check_pressed(gp, global.gp_brush);
		keyAction = keyboard_check_pressed(global.key_action) ||
			gamepad_button_check_pressed(gp, global.gp_action);
	
		keyReset = keyboard_check_pressed(ord("R"));
	}
	else
	{
		keyLeft = keyboard_check(global.key_left);
		keyRight = keyboard_check(global.key_right);
		keyUp = keyboard_check(global.key_up);
		keyDown = keyboard_check(global.key_down);
		keyJump = keyboard_check_pressed(global.key_jump);
		keyJumpHeld = keyboard_check(global.key_jump);
		keyBrush = keyboard_check_pressed(global.key_brush);
		keyAction = keyboard_check_pressed(global.key_action);
	
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
			
			if (canMove && (keyLeft xor keyRight))
			{
				SetState(ST_Player.walk);
			}
			
			if (!onGround)
			{
				if (vsp >= 0) SetState(ST_Player.falling)
				else SetState(ST_Player.rising);
			}
			
			ProcessPowers();
			ProcessMovement(movSpd, 0);
			ProcessCollision();
		
			spriteanimator.UpdateAnimation(ts);
			break;
		
		case(-ST_Player.walk):
			spriteanimator.SetAnimationKey("walk");
			break;
			
		case(ST_Player.walk):
			spriteanimator.UpdateAnimation(ts);
			ProcessPowers();
			ProcessMovement(movSpd, 0);
			ProcessCollision();
			if (!canMove || dir = 0)
			{
				SetState(ST_Player.neutral);
			}
			
			if (!onGround)
			{
				if (vsp >= 0) SetState(ST_Player.falling)
				else SetState(ST_Player.rising);
			}
			
			// Ground Combat
			if (canAttack && keyBrush)
			{
				spd = atkMovSpd;
				isAttackingGround = true;
			
				SetState(ST_Player.attack1);
			}
			break;
		
		case(-ST_Player.rising):
			spriteanimator.SetAnimationKey("rising");
			break;
		
		case(ST_Player.rising):
			spriteanimator.UpdateAnimation(ts);
			ProcessPowers();
			ProcessMovement(movSpd, 0);
			ProcessCollision();	
			if (vsp > 0) SetState(ST_Player.falling);
			
			// Combat
			if (canAttack && keyBrush)
			{
				spd = atkMovSpd;
				isAttackingGround = true;
			
				SetState(ST_Player.attack1);
			}
			break;
		
		case(-ST_Player.falling):
			spriteanimator.SetAnimationKey("falling");
			break;
		
		case(ST_Player.falling):
			spriteanimator.UpdateAnimation(ts);
			ProcessPowers();
			ProcessMovement(movSpd, 0);
			ProcessCollision();
			if (onGround) SetState(ST_Player.neutral);
			
			// Combat
			if (canAttack && keyBrush)
			{
				spd = atkMovSpd;
				isAttackingGround = true;
			
				SetState(ST_Player.attack1);
			}
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
			spriteanimator.UpdateAnimation(ts);
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
	if (damage > 0)
	{
		if (iFrames == 0)
		{
			return P_TakeDamage(damage, attacker);
		}
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

function OnDefeat()
{
	instance_create_depth(x, y, 0, obj_player_defeat);
}