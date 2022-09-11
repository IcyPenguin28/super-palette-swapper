/// @description Insert description here
// You can write your code in this editor
#region NUMPAD SHORTCUTS
if (array_has_value(colorList, colors.red) && keyboard_check_pressed(vk_numpad8) || keyboard_check_pressed(ord("1")))
{
	activeSlot = 1;
}

if (array_has_value(colorList, colors.orange) && keyboard_check_pressed(vk_numpad9) || keyboard_check_pressed(ord("2")))
{
	activeSlot = 2;
}

if (array_has_value(colorList, colors.yellow) && keyboard_check_pressed(vk_numpad6) || keyboard_check_pressed(ord("3")))
{
	activeSlot = 3;
}

if (array_has_value(colorList, colors.green) && keyboard_check_pressed(vk_numpad3) || keyboard_check_pressed(ord("4")))
{
	activeSlot = 4;
}

if (array_has_value(colorList, colors.cyan) && keyboard_check_pressed(vk_numpad2) || keyboard_check_pressed(ord("5")))
{
	activeSlot = 5;
}

if (array_has_value(colorList, colors.blue) && keyboard_check_pressed(vk_numpad1) || keyboard_check_pressed(ord("6")))
{
	activeSlot = 6;
}

if (array_has_value(colorList, colors.indigo) && keyboard_check_pressed(vk_numpad4) || keyboard_check_pressed(ord("7")))
{
	activeSlot = 7;
}

if (array_has_value(colorList, colors.purple) && keyboard_check_pressed(vk_numpad7) || keyboard_check_pressed(ord("8")))
{
	activeSlot = 8;
}

if (array_has_value(colorList, colors.empty) && keyboard_check_pressed(vk_numpad5) || keyboard_check_pressed(ord("D")))
{
	activeSlot = 0;
}
#endregion

#region ROTATE THROUGH COLORS
if (keyboard_check_pressed(ord("A")))
{
	activeSlot --;
}

if (keyboard_check_pressed(ord("S")))
{
	activeSlot ++;
}
#endregion

// Set player's color to the one highlighted by the palette
obj_player.myCol = colorList[activeSlot];