/// @description Insert description here
// You can write your code in this editor


draw_set_valign(fa_middle);
draw_set_halign(fa_center);

if instance_exists(obj_player)
{
	var p = obj_player;
	var _padding = 48;
	var w = 32;
	var h = 32;
	var xx = p.x + p.sprite_width/2 * -sign(p.image_xscale);
	var yy = p.y - _padding - p.sprite_height/2;
	
	if !moved && movestep >= moveTimer
	{
		// Player has yet to move. Prompt them to do so.
		draw_sprite_stretched(input_verb_get_icon("right"), image_speed,xx, yy, w, h);
	}
	else if !jumped && jumpstep >= jumpTimer
	{
		// Player has yet to jump. Prompt them to do so.
		draw_sprite_stretched(input_verb_get_icon("jump"), image_speed,xx, yy, w, h);
	}
	else if !attacked && attackstep >= attackTimer && instance_exists(obj_crate)
	{
		// Player has yet to attack. Prompt them to do so.
		var c = instance_nearest(p.x, p.y, obj_crate);
		if (abs(point_distance(p.x, p.y, c.x, c.y)) <= 80)
		{
			draw_sprite_stretched(input_verb_get_icon("brush"), image_speed,xx, yy, w, h);
		}
	}
	else if !slammed && slamstep >= slamTimer && (abs(point_distance(p.x, p.y, 3488, 544)) <= 80)
	{
		// Player has yet to slam. Prompt them to do so.
		if p.onGround
		{
			draw_sprite_stretched(input_verb_get_icon("jump"), image_speed,xx, yy, w, h);
		}
		else
		{
			draw_sprite_stretched(input_verb_get_icon("down"), image_speed, xx - sprite_get_width(input_verb_get_icon("down")) / 2 - 8, yy, w, h);
			draw_sprite_stretched(input_verb_get_icon("jump"), image_speed, xx + sprite_get_width(input_verb_get_icon("jump")) / 2 + 8, yy, w, h);
		}
	}
}