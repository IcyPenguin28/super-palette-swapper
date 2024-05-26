/// @description Insert description here
// You can write your code in this editor


keyRead = keyboard_check_pressed(global.key_brush) || gamepad_button_check_pressed(global.gp_device, global.gp_brush);

if place_meeting(x, y, obj_player) && keyRead
{
	instance_create_depth(0, 0, 0, myScene);
}