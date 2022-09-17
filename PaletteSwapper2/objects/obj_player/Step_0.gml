/// @description Insert description here
// You can write your code in this editor

#region CONTROLS
keyLeft = keyboard_check(vk_left);
keyRight = keyboard_check(vk_right);
keyUp = keyboard_check(vk_up);
keyDown = keyboard_check(vk_down);
keyJump = keyboard_check_pressed(ord("Z"));
keyBrush = keyboard_check_pressed(ord("X"));
keyAction = keyboard_check_pressed(ord("C"));
keyRotateL = keyboard_check_pressed(ord("A"));
keyRotateR = keyboard_check_pressed(ord("S"));
keyReset = keyboard_check_pressed(ord("R"));
#endregion

onGround = (place_meeting(x,y+1,obj_solid) && sign(grav) == 1 ||
			place_meeting(x,y-1,obj_solid) && sign(grav) == -1);
inWater = place_meeting(x,y,obj_water);
canShoot = (instance_number(obj_paintbullet) < maxPaintBullets && shootstep == 0);
canBomb = (instance_number(obj_paintbomb) < maxBombs && shootstep = 0);

#region MOVEMENT
dir = keyRight - keyLeft;
if (!isDashing)
{
	hsp = dir * spd;
}

//Context dependent movement options
if (onGround) //on ground
{
	// Ground Combat
	if (keyBrush)
	{
		spd = atkMovSpd;
		isAttackingGround = true;
	}
	coyoteTime = coyoteTimeMax;
}
else if (inWater) //in water
{

}
else //airborne
{
	vsp += grav; //add gravity to player's vertical speed
	// Aerial Combat
	if (keyBrush)
	{
		spd = atkMovSpd;
		isAttackingAir = true;
	}
}

//Coyote time
if (coyoteTime > 0)
{
    coyoteTime--;
}

//Jump input buffering
if (keyJump)
{
    jumpFrames = 0;
}

if (jumpFrames < jumpFramesMax)
{
    jumpFrames++;
}

//Jump
if ((onGround || coyoteTime > 0) && jumpFrames < jumpFramesMax)
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
if (place_meeting(x,y+vsp,obj_solid))
{
	while (!place_meeting(x,y+sign(vsp),obj_solid))
	{
		y += sign(vsp);
	}
	vsp = 0;
}
y += vsp;

#endregion

#region TIMERS
// Dash Timer
if dashstep > 0
{
	dashstep --;

	if dashstep == 0 // Countdown is complete
	{
		canDash = true;
		isDashing = false;
	}
}

// Shoot Timer
if shootstep > 0
{
	shootstep --;
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
image_yscale = sign(grav);
#endregion

#region DEBUG
if (keyReset)
{
	room_restart();
}
#endregion