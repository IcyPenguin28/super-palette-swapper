/// @description Insert description here
// You can write your code in this editor


if (instance_exists(obj_player))
{
	var p = obj_player;
	
	// Increment timer to prompt player to move, else never show prompt
	if (p.x == p.xstart)
	{
		movestep ++;
	}
	else
	{
		moved = true;
	}
	
	// Increment timer to prompt player to jump, else never show prompt
	if (round(p.y) == p.ystart + 1)
	{
		jumpstep ++;
	}
	else if (p.y < p.ystart)
	{
		jumped = true;
	}
	
	// Increment timer to prompt player to attack, else never show prompt
	if (instance_exists(obj_crate))
	{
		var c = instance_nearest(p.x, p.y, obj_crate);
		
		if (abs(point_distance(p.x, p.y, c.x, c.y)) <= 80)
		{
			attackstep ++;
		}
		else if (p.state == abs(ST_Player.attack1))
		{
			attacked = true;
		}
	}
	
	// Increment timer to prompt player to attack, else never show prompt
	show_debug_message(abs(point_distance(p.x, p.y, 3488, 544)));
	if (abs(point_distance(p.x, p.y, 3488, 544)) <= 80)
	{
		slamstep ++;
	}
	else if (p.state == abs(ST_Player.action))
	{
		slammed = true;
	}
}

// Destroy if all tutorials done
if moved && jumped && attacked && slammed
{
	instance_destroy();
}