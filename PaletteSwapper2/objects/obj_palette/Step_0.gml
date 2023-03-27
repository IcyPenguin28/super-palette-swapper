/// @description Insert description here
// You can write your code in this editor

#region GAMEPAD SETUP
var gp = global.gp_device;
if gp != -1
{
	keyRotateL = keyboard_check_pressed(ord("A")) ||
		gamepad_button_check_pressed(gp, gp_shoulderl);
	keyRotateR = keyboard_check_pressed(ord("S")) ||
		gamepad_button_check_pressed(gp, gp_shoulderr);
		
	//Shortcut Keys
	keyW = keyboard_check_pressed(vk_numpad5) ||
		keyboard_check_pressed(ord("D")) ||
		gamepad_button_check_pressed(gp, gp_stickr);
		
	keyR = keyboard_check_pressed(vk_numpad8) ||
		keyboard_check_pressed(ord("1")) ||
		abs(min(0,gamepad_axis_value(gp, gp_axisrv)));
			
	keyO = keyboard_check_pressed(vk_numpad9) ||
		keyboard_check_pressed(ord("2")) ||
		(abs(min(0,gamepad_axis_value(gp, gp_axisrv))) &&
		max(0,gamepad_axis_value(gp, gp_axisrh)));
		
	keyY = keyboard_check_pressed(vk_numpad6) ||
		keyboard_check_pressed(ord("3")) ||
		max(0,gamepad_axis_value(gp, gp_axisrh));
		
	keyG = keyboard_check_pressed(vk_numpad3) ||
		keyboard_check_pressed(ord("4")) ||
		(max(0,gamepad_axis_value(gp, gp_axisrh)) &&
		max(0,gamepad_axis_value(gp, gp_axisrv)));
		
	keyC = keyboard_check_pressed(vk_numpad2) ||
		keyboard_check_pressed(ord("5")) ||
		max(0,gamepad_axis_value(gp, gp_axisrv));
		
	keyB = keyboard_check_pressed(vk_numpad1) ||
		keyboard_check_pressed(ord("6")) ||
		(abs(min(0,gamepad_axis_value(gp, gp_axisrh))) &&
		max(0,gamepad_axis_value(gp, gp_axisrv)));
		
	keyI = keyboard_check_pressed(vk_numpad4) ||
		keyboard_check_pressed(ord("7")) ||
		abs(min(0,gamepad_axis_value(gp, gp_axisrh)));
		
	keyP = keyboard_check_pressed(vk_numpad7) ||
		keyboard_check_pressed(ord("8")) ||
		(abs(min(0,gamepad_axis_value(gp, gp_axisrh))) &&
		abs(min(0,gamepad_axis_value(gp, gp_axisrv))));
}
else
{
	keyRotateL = keyboard_check_pressed(ord("A"));
	keyRotateR = keyboard_check_pressed(ord("S"));
	
	//Shortcut Keys
	keyW = keyboard_check_pressed(vk_numpad5) ||
		keyboard_check_pressed(ord("D"));
		
	keyR = keyboard_check_pressed(vk_numpad8) ||
		keyboard_check_pressed(ord("1"));
			
	keyO = keyboard_check_pressed(vk_numpad9) ||
		keyboard_check_pressed(ord("2"));
	
	keyY = keyboard_check_pressed(vk_numpad6) ||
		keyboard_check_pressed(ord("3"));
		
	keyG = keyboard_check_pressed(vk_numpad3) ||
		keyboard_check_pressed(ord("4"));
		
	keyC = keyboard_check_pressed(vk_numpad2) ||
		keyboard_check_pressed(ord("5"));
		
	keyB = keyboard_check_pressed(vk_numpad1) ||
		keyboard_check_pressed(ord("6"));
		
	keyI = keyboard_check_pressed(vk_numpad4) ||
		keyboard_check_pressed(ord("7"));
		
	keyP = keyboard_check_pressed(vk_numpad7) ||
		keyboard_check_pressed(ord("8"));
}
#endregion

#region NUMPAD/RIGHT STICK SHORTCUTS
if (array_has_value(colorList, PlayerPaintColors.red) && keyR)
{
	activeSlot = 1;
}

if (array_has_value(colorList, PlayerPaintColors.orange) && keyO)
{
	activeSlot = 2;
}

if (array_has_value(colorList, PlayerPaintColors.yellow) && keyY)
{
	activeSlot = 3;
}

if (array_has_value(colorList, PlayerPaintColors.green) && keyG)
{
	activeSlot = 4;
}

if (array_has_value(colorList, PlayerPaintColors.cyan) && keyC)
{
	activeSlot = 5;
}

if (array_has_value(colorList, PlayerPaintColors.blue) && keyB)
{
	activeSlot = 6;
}

if (array_has_value(colorList, PlayerPaintColors.indigo) && keyI)
{
	activeSlot = 7;
}

if (array_has_value(colorList, PlayerPaintColors.purple) && keyP)
{
	activeSlot = 8;
}

if (array_has_value(colorList, PlayerPaintColors.white) && keyW)
{
	activeSlot = 0;
}
#endregion

#region ROTATE THROUGH COLORS
if keyRotateL
{
	do
	{
		if (activeSlot > 0)
		{
			activeSlot --;
		}
		else
		{
			activeSlot = array_length(colorList) - 1;
		}
	}
	until (colorList[activeSlot] != PlayerPaintColors.empty);
}

if keyRotateR
{
	do
	{
		if (activeSlot < array_length(colorList) - 1)
		{
			activeSlot ++;
		}
		else
		{
			activeSlot = 0;
		}
	}
	until (colorList[activeSlot] != PlayerPaintColors.empty);
}
#endregion

//Move cursor to location of active color
move_palette_cursor(colorCoords[activeSlot][0], colorCoords[activeSlot][1]);

// Set player's color to the one highlighted by the palette
if instance_exists(obj_player)
{
	obj_player.myCol = colorList[activeSlot];
}

painttheta = (activeSlot - PlayerPaintColors.white + 1) * paintthetasep;
paintthetadraw = approach_value(paintthetadraw, painttheta, 3);