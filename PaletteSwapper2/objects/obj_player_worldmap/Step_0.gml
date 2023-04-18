/// @description Insert description here
// You can write your code in this editor
#region CONTROLS
var gp = global.gp_device;

if gp == -1
{
	keyLeft = keyboard_check_pressed(vk_left)  || gamepad_button_check_pressed(global.gp_device, gp_padl);
	keyRight = keyboard_check_pressed(vk_right)  || gamepad_button_check_pressed(global.gp_device, gp_padr);
	keyUp = keyboard_check_pressed(vk_up)  || gamepad_button_check_pressed(global.gp_device, gp_padu);
	keyDown = keyboard_check_pressed(vk_down)  || gamepad_button_check_pressed(global.gp_device, gp_padd);
	keyConfirm = keyboard_check_pressed(ord("Z"))  || gamepad_button_check_pressed(global.gp_device, gp_face1);
	keyCancel = keyboard_check_pressed(ord("X"))  || gamepad_button_check_pressed(global.gp_device, gp_face2);
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

// Find node that navigator has been placed on
if (!destNode)
{
	destNode = instance_nearest(x, y, obj_worldmapnode);
}

// Node navigation
if ( canMove && !isMoving )
{
	var xdist = 0, ydist = 0;
	
	// Set direction based on keypress
	if ( keyRight )
	{
		xdist = 640;
	}
	else if ( keyLeft )
	{
		xdist = -640;
	}
	else if ( keyDown )
	{
		ydist = 360;
	}
	else if ( keyUp )
	{
		ydist -= 360
	}
	
	// Scan for nodes in direction
	if (xdist != 0 || ydist != 0)
	{
		numDests = collision_line_list(x, y, x + xdist, y + ydist, obj_worldmapnode, false, true, possibleDests, true);
		show_debug_message("Initial destination node: " + string(destNode));
		
		// Check for valid nodes in direction
		var _nd;
		
		for (var i = 0; i < numDests; i++)
		{
			_nd = ds_list_find_value(possibleDests, i);
			
			// If node is unlocked and not the active node
			if ( _nd != destNode && _nd.unlocked )
			{
				destNode = ds_list_find_value(possibleDests, i);
				isMoving = true;
				break;	// Break loop once valid node is found
			}
		}
		
		// Shake on invalid move
		if ( !isMoving )
		{
			shakeTime = 20;
			shakeDirection = darctan2(ydist, xdist);
		}
		else
		{
			shakeTime = 0;
		}
		
		ds_list_clear(possibleDests);
	}
}

// Move to active node
if (destNode != noone)
{
	// TODO: Find a way to prevent the player from moving to levels they have yet to unlock
	// Done - Isaiah
	
	if (isMoving)
	{
		// Step towards active node (regardless of direction)
		var _d = point_distance(x, y, destNode.x, destNode.y);
		var _d2 = max(0, lerp(_d, -_d/2, slideAmt));	// Bit of an overshoot for speed
		var _angle = point_direction(x, y, destNode.x, destNode.y);
		
		x = destNode.x - lengthdir_x(_d2, _angle);
		y = destNode.y - lengthdir_y(_d2, _angle);
		
		// Clamp to node if close enough
		if (_d2 <= 1)
		{
			isMoving = false;
			x = destNode.x;
			y = destNode.y;
		}
	}
	// Shake on invalid move
	else if (shakeTime > 0)
	{
		var _sign = sin(shakeTime) * sqrt(abs(shakeTime));
		x = destNode.x + lengthdir_x(_sign, shakeDirection);
		y = destNode.y + lengthdir_y(_sign, shakeDirection);
		
		shakeTime = approach_value(shakeTime, 0, 1);
	}
}

// Open level preview
if (keyConfirm) && destNode.unlocked
{
	if !instance_exists(obj_levelpreview)
	{
		instance_create_layer(0, 0, "Instances", obj_levelpreview);
	}
	
	with instance_nearest(x, y, obj_levelpreview)
	{
		onScreen = true;
		SetNode(other.destNode);
	}
	
	canMove = false;
}

// Close level preview
if (keyCancel) && instance_exists(obj_levelpreview)
{
	with instance_nearest(x, y, obj_levelpreview)
	{
		onScreen = false;
	}
	
	canMove = true;
}
