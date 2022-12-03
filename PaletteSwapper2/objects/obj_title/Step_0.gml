/// @description Insert description here
// You can write your code in this editor

if keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("Z"))
{
	if (!soundplayed)
	{
		audio_play_sound(snd_menuselection_final, 0, false);
		soundplayed = true;
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