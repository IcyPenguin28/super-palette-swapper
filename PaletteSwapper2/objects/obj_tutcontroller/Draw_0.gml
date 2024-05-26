/// @description Insert description here
// You can write your code in this editor

// TODO: Draw appropriate keybind icons when you make them

if instance_exists(obj_player)
{
	var p = obj_player;
	var _padding = 48;
	
	if !moved && movestep >= moveTimer
	{
		// Player has yet to move. Prompt them to do so.
		draw_sprite(spr_prompt_kb, 8, p.x, p.y - _padding);
	}
	else if !jumped && jumpstep >= jumpTimer
	{
		// Player has yet to jump. Prompt them to do so.
		draw_sprite(spr_prompt_kb, 0, p.x, p.y - _padding);
	}
	else if !attacked && attackstep >= attackTimer && instance_exists(obj_crate)
	{
		// Player has yet to attack. Prompt them to do so.
		var c = instance_nearest(p.x, p.y, obj_crate);
		if (abs(point_distance(p.x, p.y, c.x, c.y)) <= 80)
		{
			draw_sprite(spr_prompt_kb, 1, p.x, p.y - _padding);
		}
	}
	else if !slammed && slamstep >= slamTimer && (abs(point_distance(p.x, p.y, 3488, 544)) <= 80)
	{
		// Player has yet to slam. Prompt them to do so.
		if p.onGround
		{
			draw_sprite(spr_prompt_kb, 0, p.x, p.y - _padding);
		}
		else
		{
			draw_sprite(spr_prompt_kb, 6, p.x - sprite_get_width(spr_prompt_kb) / 2 - 4, p.y - _padding);
			draw_sprite(spr_prompt_kb, 0, p.x + sprite_get_width(spr_prompt_kb) / 2 + 4, p.y - _padding);
		}
	}
}