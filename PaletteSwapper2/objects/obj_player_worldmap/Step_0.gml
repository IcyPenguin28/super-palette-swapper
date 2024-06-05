/// @description Insert description here
// You can write your code in this editor
#region CONTROLS
keyUp = input_check_pressed("up");
keyDown = input_check_pressed("down");
keyLeft = input_check_pressed("left");
keyRight = input_check_pressed("right");
keyConfirm = input_check_pressed("confirm");
keyCancel = input_check_pressed("cancel");
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
if (keyConfirm) && destNode.unlocked && !instance_exists(obj_textbox)
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

if instance_exists(obj_textbox) || instance_exists(obj_levelpreview)
{
	canMove = false;
}
else
{
	canMove = true;
}

// Close level preview
if (keyCancel) && instance_exists(obj_levelpreview) && !instance_exists(obj_textbox)
{
	with instance_nearest(x, y, obj_levelpreview)
	{
		onScreen = false;
	}
	
	canMove = true;
}
