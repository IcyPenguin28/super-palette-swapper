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

#region UPDATING STATES
onGround = (place_meeting(x,y+1,obj_solid) && sign(grav) == 1 ||
			place_meeting(x,y-1,obj_solid) && sign(grav) == -1);
inWater = place_meeting(x,y,obj_water);
canShoot = (instance_number(obj_paintbullet) < maxPaintBullets && shootstep == 0);
canBomb = (instance_number(obj_paintbomb) < maxBombs && shootstep = 0);

if onGround
{
	if dashstep == 0
	{
		canDash = true;
	}
}
#endregion

#region MOVEMENT
if !canMove
{
	keyRight = 0;
	keyLeft = 0;
}

dir = keyRight - keyLeft;
if (!isDashing)
{
	hsp = lerp(hsp, dir * spd, gAccel);
}

//Context dependent movement options
if (onGround) //on ground
{
	// Ground Combat
	if (canAttack && keyBrush && !isAttackingGround && !isAttackingAir)
	{
		spd = atkMovSpd;
		isAttackingGround = true;
		image_index = 0;
	}
	else if (canAttack && keyBrush && isAttackingGround && !isAttackingAir)
	{
		changeAttackState = true;	
	}
	
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
		spd = atkMovSpd;
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

#endregion

#region COLLISION
//Horizontal
if (place_meeting(x+hsp,y,obj_solid))
{
	while (!place_meeting(x+sign(hsp),y,obj_solid))
	{
		x += sign(hsp);
	}
	hsp = 0;
}
x += hsp;

//Vertical
var _vspw = vsp;	// Working Speed

// Slow speed if attacking in air
if (isAttackingAir)
{
	_vspw *= airAttackDescent;
}

if (place_meeting(x,y+_vspw,obj_solid))
{
	while (!place_meeting(x,y+sign(_vspw),obj_solid))
	{
		y += sign(_vspw);
	}
	
	_vspw = 0;
	vsp = 0;	// Reset original value too
}
y += _vspw;

#endregion

#region DYING LOL
if hp <= 0
{
	hitStop = false;
	instance_destroy();
}
#endregion

#region TIMERS
// Dash Timer
if dashstep > 0
{
	dashstep --;

	if dashstep == 0 // Countdown is complete
	{
		isDashing = false;
		if onGround
		{
			canDash = true;
		}
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
#endregion

#region COLOR POWERS
switch (myCol)
{
	// RED
	case colors.red:
		if (canDash && keyAction)
		{
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
		}
		if (isDashing)
		{
			vsp = 0;
			hsp = dashSpd * dashDir;
		}
		break;
	// ORANGE
	case colors.orange:
		if (canShoot && keyBrush)
		{
			shootstep = shootTime;
			with instance_create_layer(x + sign(image_xscale), y, "Instances", obj_paintbullet)
			{
				dir = sign(other.image_xscale);
				grav = sign(other.grav) * grav;
			}
		}
		break;
	// YELLOW
	case colors.yellow:
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
	case colors.green:
		break;
	// CYAN
	case colors.cyan:
		break;
	// BLUE
	case colors.blue:
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
	case colors.indigo:
		break;
	// PURPLE
	case colors.purple:
		break;
}
#endregion

#region ANIMATION
if (dir != 0)
{
	image_xscale = sign(dir);
}

image_yscale = sign(grav);

// Attacking 
if (isAttackingGround || isAttackingAir) // (Split later for Ground vs. Air)
{
	// Set sprite based on attack state.
	switch (attackState)
	{
		case 0:
			sprite_index = spr_andy_attack_ground_0;
			if (!instance_exists(obj_attacktrail))
			{
				with (instance_create_layer(x + sprite_width, y, "Instances", obj_attacktrail))
				{
					image_xscale = other.image_xscale;
					sprite_index = spr_andy_attack_ground_0_trail;
				}
			}
			break;
		case 1:
			sprite_index = spr_andy_attack_ground_1;
			if (!instance_exists(obj_attacktrail))
			{
				with (instance_create_layer(x + sprite_width, y, "Instances", obj_attacktrail))
				{
					image_xscale = other.image_xscale;
					sprite_index = spr_andy_attack_ground_1_trail;
				}
			}
			break;
		case 2:
			sprite_index = spr_andy_attack_ground_2;
			if (!instance_exists(obj_attacktrail))
			{
				with (instance_create_layer(x + sprite_width, y, "Instances", obj_attacktrail))
				{
					image_xscale = other.image_xscale;
					sprite_index = spr_andy_attack_ground_2_trail;
				}
			}
			break;
	}
}
else if isDashing
{
	sprite_index = spr_andy_dash;
}
else
{
	sprite_index = spr_andy_idle;
}
#endregion