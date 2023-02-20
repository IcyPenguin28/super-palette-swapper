/// @description Insert description here
// You can write your code in this editor
#region CONTROLS
var gp = global.gp_device;

if gp == -1
{
	keyLeft = keyboard_check_pressed(vk_left);
	keyRight = keyboard_check_pressed(vk_right);
	keyUp = keyboard_check_pressed(vk_up);
	keyDown = keyboard_check_pressed(vk_down);
	keyConfirm = keyboard_check_pressed(ord("Z"));
	keyCancel = keyboard_check_pressed(ord("X"));
}
else
{
	keyLeft = keyboard_check_pressed(vk_left) ||
		//abs(min(0,gamepad_axis_value(gp, gp_axislh))) ||
		gamepad_button_check_pressed(gp, gp_padl);
	keyRight = keyboard_check_pressed(vk_right) ||
		//max(0,gamepad_axis_value(gp, gp_axislh)) ||
		gamepad_button_check_pressed(gp, gp_padr);
	keyUp = keyboard_check_pressed(vk_up) ||
		gamepad_button_check_pressed(gp, gp_padu);
	keyDown = keyboard_check_pressed(vk_down) ||
		gamepad_button_check_pressed(gp, gp_padd);
	keyConfirm = keyboard_check_pressed(ord("Z")) ||
		gamepad_button_check_pressed(gp, gp_start) ||
		gamepad_button_check_pressed(gp, gp_face1);
	keyCancel = keyboard_check_pressed(ord("X")) ||
		gamepad_button_check_pressed(gp, gp_face2);
}
#endregion

if (keyRight) && array_has_value(instance_nearest(x, y, obj_worldmapnode).connections, paths.right) && !movingV && !movingH
{
	movingH = true;
	numDests = collision_line_list(x, y, x + 640, y, obj_worldmapnode, false, true, possibleDests, true);
	show_debug_message("Initial destination node: " + string(destNode));
	
	for (var i = 0; i < numDests; i++)
	{
		if ds_list_find_value(possibleDests, i) != instance_nearest(x, y, obj_worldmapnode) && destNode == noone
		{
			destNode = ds_list_find_value(possibleDests, i);
		}
	}
	ds_list_clear(possibleDests);
}
else if (keyLeft) && array_has_value(instance_nearest(x, y, obj_worldmapnode).connections, paths.left) && !movingV && !movingH
{
	movingH = true;
	numDests = collision_line_list(x, y, x - 640, y, obj_worldmapnode, false, true, possibleDests, true);
	show_debug_message("Initial destination node: " + string(destNode));
	
	for (var i = 0; i < numDests; i++)
	{
		if ds_list_find_value(possibleDests, i) != instance_nearest(x, y, obj_worldmapnode) && destNode == noone
		{
			destNode = ds_list_find_value(possibleDests, i);
		}
	}
	ds_list_clear(possibleDests);
}
else if (keyUp) && array_has_value(instance_nearest(x, y, obj_worldmapnode).connections, paths.up) && !movingV && !movingH
{
	movingV = true;
	numDests = collision_line_list(x, y, x, y - 360, obj_worldmapnode, false, true, possibleDests, true);
	show_debug_message("Initial destination node: " + string(destNode));
	
	for (var i = 0; i < numDests; i++)
	{
		if ds_list_find_value(possibleDests, i) != instance_nearest(x, y, obj_worldmapnode) && destNode == noone
		{
			destNode = ds_list_find_value(possibleDests, i);
		}
	}
	ds_list_clear(possibleDests);
}
else if (keyDown) && array_has_value(instance_nearest(x, y, obj_worldmapnode).connections, paths.down) && !movingV && !movingH
{
	movingV = true;
	numDests = collision_line_list(x, y, x, y + 360, obj_worldmapnode, false, true, possibleDests, true);
	show_debug_message("Initial destination node: " + string(destNode));
	
	for (var i = 0; i < numDests; i++)
	{
		if ds_list_find_value(possibleDests, i) != instance_nearest(x, y, obj_worldmapnode) && destNode == noone
		{
			destNode = ds_list_find_value(possibleDests, i);
		}
	}
	ds_list_clear(possibleDests);
}

if (keyConfirm) && !movingH && !movingV && instance_nearest(x, y, obj_worldmapnode).unlocked
{
	if !instance_exists(obj_levelpreview)
	{
		instance_create_layer(0, 0, "Instances", obj_levelpreview);
	}
	else
	{
		with instance_nearest(x, y, obj_levelpreview)
		{
			onScreen = true;
		}
}
	
}

if (keyCancel) && instance_exists(obj_levelpreview)
{
	with instance_nearest(x, y, obj_levelpreview)
	{
		onScreen = false;
	}
}



if (destNode != noone)
{
	// TODO: Find a way to prevent the player from moving to levels they have yet to unlock
	/*if (!destNode.unlocked)
	{
		destNode = noone;
		movingH = false;
		movingV = false;
	}*/
	
	if movingH
	{
		x = lerp(x, destNode.x, slideAmt);
		if round(x) == round(destNode.x)
		{
			destNode = noone;
			movingH = false;
		}
	}
	
	if movingV
	{
		y = lerp(y, destNode.y, slideAmt);
		if round(y) == round(destNode.y)
		{
			destNode = noone;
			movingV = false;
		}
	}
}