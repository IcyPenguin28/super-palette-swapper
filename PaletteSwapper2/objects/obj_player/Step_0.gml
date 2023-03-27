/// @description Insert description here
// You can write your code in this editor

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
		break;
	
	case(ST_Player.neutral):	// State Update
		// Ground Combat
		if (canAttack && keyBrush)
		{
			spd = atkMovSpd;
			isAttackingGround = true;
			
			SetState(ST_Player.attack1);
		}
		
		ProcessMovement(movSpd, 0);
		ProcessCollision();
		
		spriteanimator.UpdateAnimation(1);
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
		
		spriteanimator.UpdateAnimation(1);
		
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


