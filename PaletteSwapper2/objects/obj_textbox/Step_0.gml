/// @description Insert description here
// You can write your code in this editor

if !closing
{
	if bgAlpha < 0.5
	{
		bgAlpha += alphaSpeed;
	}	
}
else
{
	if bgAlpha > 0 && round(width) == 16
	{
		bgAlpha -= alphaSpeed;
	}	
}

if opening
{
	y = lerp(y, maxY, stretchSpeed);
	if round(y) == (maxY)
	{
		portraitLX = lerp(portraitLX, portraitLXMax, stretchSpeed);
		portraitRX = lerp(portraitRX, portraitRXMax, stretchSpeed);
		width = lerp(width, maxWidth, stretchSpeed);
		x = lerp(x, maxX, stretchSpeed);
		if round(width) == maxWidth
		{
			width = display_get_gui_width() - margin * 2;
			y = (display_get_gui_height() - height - margin);
				
			opening = false;
		}
	}
}
else if closing
{
	width = lerp(width, 16, stretchSpeed);
	x = lerp(x, (display_get_gui_width()) / 2, stretchSpeed);
	portraitLX = lerp(portraitLX, -sprite_get_width(portraitL) * portraitScale, stretchSpeed);
	portraitRX = lerp(portraitRX, display_get_gui_width() + sprite_get_width(portraitR) * portraitScale, stretchSpeed);
	if round(width) == 16
	{
		y = lerp(y, display_get_gui_height(), stretchSpeed);
		if round(y) == display_get_gui_height()
		{
			instance_destroy();
		}
	}
}
else
{
	if swappingL
	{
		portraitLX = lerp(portraitLX, -sprite_get_width(portraitLQueued) * portraitScale * 2, stretchSpeed);
		if round(portraitLX) == -sprite_get_width(portraitLQueued) * portraitScale * 2
		{
			portraitL = portraitLQueued
			swappingL = false;
		}
	}
	else
	{
		portraitLX = lerp(portraitLX, portraitLXMax, stretchSpeed);
	}
	
	if swappingR
	{
		portraitRX = lerp(portraitRX, -sprite_get_width(portraitRQueued) * portraitScale * 2, stretchSpeed);
		if round(portraitRX) == -sprite_get_width(portraitRQueued) * portraitScale * 2
		{
			portraitR = portraitRQueued
			swappingR = false;
		}
	}
	else
	{
		portraitRX = lerp(portraitRX, portraitRXMax, stretchSpeed);
	}
	
	keyConfirm = keyboard_check_pressed(global.key_confirm) || gamepad_button_check_pressed(global.gp_device, global.gp_confirm)

	textProgress = min(textProgress + textSpeed, textLength);

	if (textProgress == textLength)
	{
		if !(soundplayed)
		{
			audio_play_sound(snd_dialogue_finish, 0, false, global.gain_sfx);
			soundplayed = true;
		}
		
		if keyConfirm
		{
			next();
		}
	}
	else
	{
		audio_play_sound(snd_dialogue_blip, 0, false, global.gain_sfx);
		if keyConfirm
		{
			textProgress = textLength;
		}
	}
}