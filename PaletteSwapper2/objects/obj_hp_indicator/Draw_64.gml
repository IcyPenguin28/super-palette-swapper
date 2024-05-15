/// @description Insert description here
// You can write your code in this editor

if onScreen
{
	xx = lerp(xx, originalXX, slideSpd);
}
else
{
	xx = lerp(xx, display_get_gui_width() + 128, slideSpd);
}

if instance_exists(obj_player)
{
	var _hp = obj_player.hp;
}
else
{
	var _hp = 0;
}

if (_hp >= 2)
{
	draw_sprite(spr_hp_indicator, sprite_get_number(spr_hp_indicator) - _hp - 2, xx, yy);
}
else if (_hp == 1)
{
	flashStep ++;
	if (flashStep < flashTime)
	{
		draw_sprite(spr_hp_indicator, 3, xx, yy);
	}
	else
	{
		draw_sprite(spr_hp_indicator, 4, xx, yy);
	}
	
	if (flashStep == 2 * flashTime)
	{
		flashStep = 0;
	}
}
else
{
	draw_sprite(spr_hp_indicator, sprite_get_number(spr_hp_indicator) - 1, xx, yy);
}