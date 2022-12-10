/// @description Insert description here
// You can write your code in this editor
var gp = global.gp_device;
if gp == -1
{
	confirmButton = keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(vk_space);
}
else
{
	confirmButton = keyboard_check_pressed(ord("Z")) ||
					keyboard_check_pressed(vk_space) ||
					gamepad_button_check_pressed(gp, gp_face1) ||
					gamepad_button_check_pressed(gp, gp_face2) ||
					gamepad_button_check_pressed(gp, gp_start);
}

#region DYNAMIC UI
var gpd = global.gp_desc;

switch (gpd)
{
	case "Nintendo Switch Pro Controller":
		sprite_index = spr_title_switch;
		break;
	case "XInput STANDARD GAMEPAD":
		sprite_index = spr_title_xbox;
		break;
	case "PLAYSTATION(R)3 Controller":
	case "Sony DualShock 4":
		sprite_index = spr_title_playstation;
		break;
	case "":
		sprite_index = spr_title_keyboard;
		break;
}

#endregion

if confirmButton
{
	if (!soundplayed)
	{
		audio_play_sound(snd_menuselection_final, 0, false);
		soundplayed = true;
		image_speed = 0.4;
	}
}

if (!audio_is_playing(snd_menuselection_final) && soundplayed)
{
	with (obj_camera_target)
	{
		x = lerp(x, 320, 0.1);
		y = lerp(y, 1080, 0.1);
	}
}
if instance_exists(obj_camera_target)
{
	if round(obj_camera_target.y) == 1080
	{
		inMenu = true;
	}	
}

if inMenu && !menuMusicTriggered
{
	audio_play_sound(mus_mainmenu, 0, true);
	menuMusicTriggered = true;
}