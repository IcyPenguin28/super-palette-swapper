/// @desc Start() Update() Draw()

event_inherited();

function Start()
{
	
}

// Same as Base class' SetState(), just with a state name print
function SetState(_state) {
	if (state != _state) {
		show_debug_message("player.state: {0}", ST_Player_string[_state]);	
	}
	state = -abs(_state);
	event_perform(ev_step, ev_step_normal);
	state = abs(state);
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
			canWallslide = false;
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
				else
				{
					instance_create_layer(x, y, "Instances", obj_ef_slam);
					SetState(ST_Player.rising);
				}
			}
			
			ProcessPowers();
			ProcessMovement(movSpd, 0);
			ProcessCollision();
			spriteanimator.UpdateAnimation(ts);
			break;
		
		// ....................................................................
		case(-ST_Player.walk):
			spriteanimator.SetAnimationKey("walk");
			canWallslide = true;
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
				else
				{
					instance_create_layer(x, y, "Instances", obj_ef_slam);
					SetState(ST_Player.rising);
				}
			}
			
			if (alarm[0] == -1)
			{
				alarm[0] = dustTimer;
			}
			
			// Ground Combat
			if (canAttack && keyBrush)
			{
				spd = atkMovSpd;
				isAttackingGround = true;
			
				SetState(ST_Player.attack1);
			}
			break;
		
		// ....................................................................
		case(-ST_Player.rising):
			spriteanimator.SetAnimationKey("rising");
			canWallslide = false;
			break;
		
		case(ST_Player.rising):
			spriteanimator.UpdateAnimation(ts);
			ProcessPowers();
			ProcessMovement(movSpd, 0);
			ProcessCollision();	
			if (vsp >= 0) SetState(ST_Player.falling);
			
			// Combat
			if (canAttack && keyBrush)
			{
				spd = atkMovSpd;
				isAttackingGround = true;
			
				SetState(ST_Player.attack1);
			}
			
			if (keyDown && keyJump) //&& myCol != PlayerPaintColors.red)
			{
				SetState(ST_Player.action);
			}
			break;
		
		// ....................................................................
		case(-ST_Player.falling):
			spriteanimator.SetAnimationKey("falling");
			canWallslide = true;
			break;
		
		case(ST_Player.falling):
			spriteanimator.UpdateAnimation(ts);
			ProcessPowers();
			ProcessMovement(movSpd, 0);
			ProcessCollision();
			if (onGround)
			{
				recoiling = false;
				dashSlamming = false;
				SetState(ST_Player.neutral);
			}
			
			// Combat
			if (canAttack && keyBrush)
			{
				spd = atkMovSpd;
				isAttackingGround = true;
			
				SetState(ST_Player.attack1);
			}
			
			if (keyDown && keyJump) //&& myCol != PlayerPaintColors.red)
			{
				SetState(ST_Player.action);
			}
			break;
			
		// Attacks =====================================================
		case(-ST_Player.attack1):
			changeAttackState = false;
			lockdir = true;
			spriteanimator.SetAnimationKey("attack1a");
			canWallslide = false;
		
			OnAttack();
			break;
		
		// ....................................................................
		case(-ST_Player.attack2):
			changeAttackState = false;
			lockdir = true;
			spriteanimator.SetAnimationKey("attack2a");
		
			OnAttack();
			break;
		
		// ....................................................................
		case(-ST_Player.attack3):
			changeAttackState = false;
			lockdir = true;
			spriteanimator.SetAnimationKey("attack3a");
		
			OnAttack();
			break;
	
		case(ST_Player.attack1):
		case(ST_Player.attack2):
		case(ST_Player.attack3):
			dashSlamming = false;
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
		
		// Character Action (Andy: Slam) ===============================
		case (-ST_Player.action):
			spriteanimator.SetAnimationKey("slam");
			beginSlam = true;
			canWallslide = false;
			break;
		
		case (ST_Player.action):
			spriteanimator.UpdateAnimation(ts);
			ProcessPowers();
			ProcessMovement(movSpd, 0);
			var _collisionresult = ProcessCollision();
			
			// If the player collides with a wall, end the dash slam
			if ( (_collisionresult & FL_COLLISION_L) || _collisionresult & FL_COLLISION_R ) {
				dashSlamming = false;
			}
			
			// Slam start
			if (beginSlam)
			{
				vsp = jumpSpd * 2;
				if (onGround) beginSlam = false;
				var _trail = part_system_create(ps_slamtrail);
				part_system_position(_trail, x, y);
				// part_system_destroy(_trail);
			}
			// Slam hit
			else
			{
				// Check downward collisions
				var _collisionlist = ds_list_create();
				var n = collision_point_list((bbox_left+bbox_right)*0.5, bbox_bottom+1, [obj_crate], 0, 1, _collisionlist, 0);
				var c = noone;
				
				for (var i = 0; i < n; i++) {
					c = _collisionlist[| i];
					if (c && c.object_index == obj_crate) {
						// If the player collides with a crate when slamming, destroy the crate
						if (state == ST_Player.action) {
							instance_destroy(c);
						}
					}
				}
				
				// instance_create_layer(x, y - 16, "Instances", obj_ef_slam);
				recoiling = true;
				canDash = true;
				vsp = -jumpSpd * 1.3;
				obj_camera.shakeMagY = 10;
				obj_camera.shakeTime = 1;
				audio_play_sound(snd_slam, 0, false, global.gain_sfx);
				SetState(ST_Player.neutral);
			}
			break;
		
		// Dashing =====================================================
		case(-ST_Player.dash):
			spriteanimator.SetAnimationKey("dash");
			lockdir = true;
			canDash = false;
			isDashing = true;
			dashSlamming = false;
			dashstep = dashTime;
			canWallslide = false;
			
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
			
			if (keyDown && keyJump) //&& myCol != PlayerPaintColors.red)
			{
				dashSlamming = true;
				SetState(ST_Player.action);
			}
			break;
		// Wall Jumping ======================================
		case (-ST_Player.wallSlide):
			// TODO: Get wall sliding animation key
			canWallslide = false;
			wallclingDelay = wallclingDelayTime;
			break;
		case (ST_Player.wallSlide):
			ProcessPowers();
			ProcessMovement(hsp, vsp);
			
			if (keyJump)
			{
				vsp = -jumpSpd;
				hsp = wallJumpHsp * -sign(dir);
				SetState(ST_Player.neutral);
			}
			
			if onGround
			{
				SetState(ST_Player.neutral);
			}
			
			var _collisiontestresult = TestCollision(1);
			var _walldetachhspd = 0.2;
			
			// Detach from right wall
			if (_collisiontestresult & FL_COLLISION_R) {
				if (keyLeft) {
					if (wallclingDelay > 0) {
						wallclingDelay = max(wallclingDelay-ts, 0);
					}
					else {
						SetState(ST_Player.neutral);
					}
				}
				else {
					wallclingDelay = wallclingDelayTime;
				}
			}
			// Detach from left wall
			else if (_collisiontestresult & FL_COLLISION_L) {
				if (keyRight) {
					if (wallclingDelay > 0) {
						wallclingDelay = max(wallclingDelay-ts, 0);
					}
					else {
						SetState(ST_Player.neutral);
					}
				}
				else {
					wallclingDelay = wallclingDelayTime;
				}
			}
			// Stop sliding if there's no right or left collision
			else {
				SetState(ST_Player.neutral);
			}
			
			ProcessCollision();
			
			break;
			
			
	}

	// Defeat
	if hp <= 0
	{
		hitStop = false;
		instance_destroy();
		return;
	}

	// Update Direction
	if (dir != 0 && !lockdir)
	{
		image_xscale = sign(dir);
	}

	image_yscale = sign(grav);
	
	// Move to wall slide state
	if (canWallslide && abs(state) != ST_Player.wallSlide) {
		var _collisiontestresultst = TestCollision(1);
		if ( !onGround ) {
			if ( 
				( (_collisiontestresultst & FL_COLLISION_L) && keyLeft && hsp <= 0 ) || 
				( (_collisiontestresultst & FL_COLLISION_R) && keyRight && hsp >= 0 )
			) {
				SetState(ST_Player.wallSlide);
			}
		}
	}
}

function Draw()
{
	pal_swap_set(spr_andy_palette,myCol - 1,false);
	spriteanimator.DrawLayers(x, y, c_white, image_alpha, image_xscale, image_yscale, 0);
	//draw_self();

	// Collision Debugging
	if (DEBUG)
	{
		shader_reset();	// Prevents "Draw failed" error. Necessary for primitive drawing (draw_line, draw_rectangle, etc.)
		var xx = lerp(bbox_left, bbox_right, 0.5);
		var yy = lerp(bbox_bottom, bbox_top, 0.5);
		var _perp_offset;
		
		_perp_offset  = [(bbox_bottom-y) * 0.3, (bbox_top-y) * 0.3];
		for (var p = 0; p < 2; p++) {
			draw_line_color(xx, yy+_perp_offset[p], bbox_left, yy+_perp_offset[p], c_orange, c_orange);
			draw_line_color(xx, yy+_perp_offset[p], bbox_right, yy+_perp_offset[p], c_red, c_red);
		}
		
		_perp_offset = [(bbox_right-x) * 0.3, (bbox_left-x) * 0.3];
		for (var p = 0; p < 2; p++) {
			draw_line_color(xx+_perp_offset[p], yy, xx+_perp_offset[p], bbox_top, c_olive, c_olive);
			draw_line_color(xx+_perp_offset[p], yy, xx+_perp_offset[p], bbox_bottom, c_green, c_green);
		}
		
		draw_circle_color(xx, yy, 4, c_white, c_white, 1);
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
			audio_play_sound(snd_swipe, 0, false, global.gain_sfx);
			break;
		case(PlayerPaintColors.yellow):
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