/// @description Insert description here
// You can write your code in this editor

// Display active bonus objective
draw_set_font(fnt_dialogue);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

if activeBonusObj != -1
{
	if !bonusObjFulfilled
	{
		if time < 2
		{
			draw_sprite(spr_key_empty, 0, sprite_get_width(spr_key_empty), display_get_gui_height() - sprite_get_height(spr_key_empty));
			
			draw_set_color(c_black);
			draw_text(sprite_get_width(spr_key_empty) * 2, display_get_gui_height() - sprite_get_height(spr_key_empty) + 2, criteriaString);
			draw_set_color(c_white);
			draw_text(sprite_get_width(spr_key_empty) * 2, display_get_gui_height() - sprite_get_height(spr_key_empty), criteriaString);
		}
	}
	else if !alreadyGotKey
	{
		startTime = time;
		endTime = startTime + fulfillmentDuration;
		
		if time < endTime && !instance_exists(obj_results)
		{
			if !soundplayed
			{
				audio_play_sound(snd_key, 0, false, global.gain_sfx);
				soundplayed = true;
			}
			
			draw_sprite(spr_key_filled, 0, sprite_get_width(spr_key_filled), display_get_gui_height() - sprite_get_height(spr_key_filled));
			
			draw_set_color(c_black);
			draw_text(sprite_get_width(spr_key_filled) * 2, display_get_gui_height() - sprite_get_height(spr_key_filled) + 2, criteriaString);
			draw_set_color(c_white);
			draw_text(sprite_get_width(spr_key_filled) * 2, display_get_gui_height() - sprite_get_height(spr_key_filled), criteriaString);
		}
	}
}