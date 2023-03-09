/// @desc Methods

event_inherited();

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

