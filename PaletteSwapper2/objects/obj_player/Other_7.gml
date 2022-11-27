/// @description Insert description here
// You can write your code in this editor

if (isAttackingGround)
{
	if (changeAttackState)
	{
		show_debug_message("yeah!");
		if (attackState < 2)
		{
			attackState ++;
		}
		else
		{
			attackState = 0;
		}
		changeAttackState = false;
	}
	else
	{
		attackState = 0;
		isAttackingGround = false;
		spd = movSpd;
		sprite_index = spr_andy_idle;
		image_index = 0;
	}
}

if (isAttackingAir)
{
	isAttackingAir = false;
	spd = movSpd;
}