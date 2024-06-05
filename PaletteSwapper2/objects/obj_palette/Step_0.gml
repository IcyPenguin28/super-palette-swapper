/// @description Insert description here
// You can write your code in this editor

#region GAMEPAD SETUP
var gp = global.gp_device;
keyRotateL = input_check_pressed(global.key_rotateL) ||
	gamepad_button_check_pressed(gp, global.gp_rotateL);
keyRotateR = input_check_pressed(global.key_rotateR) ||
	gamepad_button_check_pressed(gp, global.gp_rotateR);
		
//Shortcut Keys
keyW = input_check_pressed(global.key_w) ||
	gamepad_button_check_pressed(gp, global.gp_w);
		
keyR = input_check_pressed(global.key_r) ||
	gamepad_button_check_pressed(gp, global.gp_r);
		
keyY = input_check_pressed(global.key_y) ||
	gamepad_button_check_pressed(gp, global.gp_y);
		
keyG = input_check_pressed(global.key_g) ||
	gamepad_button_check_pressed(gp, global.gp_g);
		
keyB = input_check_pressed(global.key_b) ||
	gamepad_button_check_pressed(gp, global.gp_b);
#endregion


if (CalcNumColors() > 1) // Player has colors they can rotate through
{
	#region NUMPAD/RIGHT STICK SHORTCUTS
	if (array_has_value(colorList, PlayerPaintColors.red) && keyR)
	{
		activeSlot = 1;
	}

	if (array_has_value(colorList, PlayerPaintColors.yellow) && keyY)
	{
		activeSlot = 2;
	}

	if (array_has_value(colorList, PlayerPaintColors.green) && keyG)
	{
		activeSlot = 3;
	}

	if (array_has_value(colorList, PlayerPaintColors.blue) && keyB)
	{
		activeSlot = 4;
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
	// move_palette_cursor(colorCoords[activeSlot][0], colorCoords[activeSlot][1]);
}

// Set player's color to the one highlighted by the palette
if instance_exists(obj_player)
{
	obj_player.myCol = colorList[activeSlot];
}

painttheta = (activeSlot - PlayerPaintColors.white + 1) * paintthetasep;
paintthetadraw = approach_value(paintthetadraw, painttheta, 3);

// show_debug_message(colorList[activeSlot]);