/// @description Insert description here
// You can write your code in this editor

contKey = keyboard_check_pressed(ord("Z")) || gamepad_button_check_pressed(global.gp_device, gp_face1);

if a < 1
{
	a += aRate;
}

if audio_is_playing(mus_results) && !starsOnScreen
{
	starx1 = lerp(starx1, padding * (numFit / 2 - 1), slideAmt);
	starx2 = lerp(starx2, padding * (numFit / 2), slideAmt);
	starx3 = lerp(starx3, padding * (numFit / 2 + 1), slideAmt);
	if round(starx3) == round(padding * (numFit / 2 + 1))
	{
		starsOnScreen = true;
	}
}

if starsOnScreen
{
	if (alarm[0] == -1 && !star1Filled) alarm[0] = room_speed * 0.5;
	if (alarm[1] == -1 && !star2Filled) alarm[1] = room_speed;
	if (alarm[2] == -1 && !star3Filled) alarm[2] = room_speed * 1.5;
	if (alarm[3] == -1 && !keyFilled) alarm[3] = room_speed * 2;
	if (alarm[4] == -1 && !canContinue) alarm[4] = room_speed * 2.5;
}

if star1Filled
{
	if scale1 < baseScale * scaleFactor
	{
		scale1 += scaleRate;
	}
}

if star2Filled
{
	if scale2 < baseScale * scaleFactor
	{
		scale2 += scaleRate;
	}
}

if star3Filled
{
	if scale3 < baseScale * scaleFactor
	{
		scale3 += scaleRate;
	}
}

if keyFilled
{
	if scale4 < baseScale * scaleFactor
	{
		scale4 += scaleRate;
	}
}

if canContinue && contKey
{
	if file_exists(global.active_savefile)
	{
		
	}
	ini_open(global.active_savefile);
	ini_write_real(room_get_name(room), "cleared", 1);
	
	if (ini_read_real(room_get_name(room), "star1", 0) == 0)
	{
		ini_write_real(room_get_name(room), "star1", star1Filled);
	}
	
	if (ini_read_real(room_get_name(room), "star2", 0) == 0)
	{
		ini_write_real(room_get_name(room), "star2", star2Filled);
	}
	
	if (ini_read_real(room_get_name(room), "star3", 0) == 0)
	{
		ini_write_real(room_get_name(room), "star3", star3Filled);
	}
	
	if (ini_read_real(room_get_name(room), "key", 0) == 0)
	{
		ini_write_real(room_get_name(room), "key", keyFilled);
	}
	
	ini_close();
	// room_goto(rm_worldmap);
	with (instance_create_layer(0, 0, "Instances", obj_transition))
	{
		target_room = rm_worldmap;
	}
}