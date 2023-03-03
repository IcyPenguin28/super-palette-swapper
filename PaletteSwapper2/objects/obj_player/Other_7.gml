/// @description Insert description here
// You can write your code in this editor

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
		// Reset to zero on 3
		else
		{
			attackState = 0;
		}
		changeAttackState = false;
	}
	// No attack is queued. Reset appropriate values
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