/// @description Insert description here
// You can write your code in this editor

// Full-Screen
if keyboard_check_pressed(vk_f1)
{
	window_set_fullscreen(!window_get_fullscreen())
}

if instance_exists(obj_camera_target)
{
	show_debug_message(obj_camera_target.y)
}