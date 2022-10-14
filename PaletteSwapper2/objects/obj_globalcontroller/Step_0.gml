/// @description Insert description here
// You can write your code in this editor
global.gp_device = gamepad_detect_device();

#region DEBUG
var keyReset = keyboard_check_pressed(ord("R"));
if (keyReset)
{
	room_restart();
}
#endregion