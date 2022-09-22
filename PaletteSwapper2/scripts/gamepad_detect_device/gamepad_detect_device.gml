// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function gamepad_detect_device()
{
	for (var i = 0; i < gamepad_get_device_count(); i++)
	{
		if gamepad_is_connected(i)
		{
			return i;
		}
	}
	return -1;
}