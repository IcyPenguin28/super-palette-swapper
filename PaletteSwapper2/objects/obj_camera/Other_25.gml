/// @desc Functions

function Update(ts=1)
{
	camX = camera_get_view_x(cam);
	camY = camera_get_view_y(cam);

	camW = camera_get_view_width(cam);
	camH = camera_get_view_height(cam);
	
	// Determine target
	onTarget = false;

	switch(state)
	{
		case(ST_Camera.entity):
			var p = cameratarget;
		
			if instance_exists(p)
			{
				locationtarget[0] = p.x - (wRes/2);
				locationtarget[1] = p.y - (hRes/2);
			}
			break;
	
		case(ST_Camera.player):
			var p = obj_player;
			if instance_exists(p)
			{
				locationtarget[0] = p.x - (wRes/2) + sign(p.image_xscale) * playerCamLookX;
				locationtarget[1] = p.y - (hRes/2);
			}
			break;
	
		case(ST_Camera.free):
			if !instance_exists(obj_camera_target)
			{
				instance_create_layer(camX, camY, "Instances", obj_camera_target);
			}
		
			locationtarget[0] = obj_camera_target.x - (wRes/2);
			locationtarget[1] = obj_camera_target.y - (hRes/2);	
			break;
	}
	
	// Clamp bounds before use
	var _boundx1 = bounds[0];
	var _boundy1 = bounds[1];
	var _boundx2 = bounds[2];
	var _boundy2 = bounds[3];
	
	if ( abs(_boundx2-_boundx1) < wRes )
	{
		// Bound to center value
		_boundx1 = lerp(_boundx1, _boundx2, 0.5) + wRes/2;
		_boundx2 = _boundx1;
	}
	
	if ( abs(_boundy2-_boundy1) < hRes )
	{
		// Bound to center value
		_boundy1 = lerp(_boundy1, _boundy2, 0.5) + hRes/2;
		_boundy2 = _boundy1;
	}
	

	// Calculate final position
	locationtarget[0] = clamp(locationtarget[0], _boundx1, _boundx2-wRes);
	locationtarget[1] = clamp(locationtarget[1], _boundy1, _boundy2-hRes);

	locationintermediate[0] = lerp(locationintermediate[0], locationtarget[0], panSpd*ts);
	locationintermediate[1] = lerp(locationintermediate[1], locationtarget[1], panSpd*ts);

	location[0] = lerp(location[0], locationintermediate[0], panSpd*ts);
	location[1] = lerp(location[1], locationintermediate[1], panSpd*ts);

	// Apply position
	camX = location[0];
	camY = location[1];

	camera_set_view_pos(cam,camX,camY);

	onTarget = point_distance(location[0], location[1], locationtarget[0], locationtarget[1]) <= 1;
}

function SetLocation(_x, _y)
{
	location[0] = _x;
	location[1] = _y;
	locationintermediate[0] = _x;
	locationintermediate[1] = _y;
	locationtarget[0] = _x;
	locationtarget[1] = _y;
	
	Update(0);
}

// Use without argument to reset
function SetSpeed(_pan_speed=0.08)
{
	panSpd = _pan_speed;
}

function SetState(camstate)
{
	state = camstate;
	Update(0);
}

// Sets min and max location of camera
function SetBounds(_x1, _y1, _x2, _y2)
{
	bounds = [_x1, _y1, _x2, _y2];
}

function SnapToTarget()
{
	SetLocation(locationtarget[0], locationtarget[1]);
	Update(0);
}

function FollowPlayer()
{
	state = ST_Camera.player;
	Update(0);
}

function FollowTarget(target)
{
	state = ST_Camera.entity;
	cameratarget = target;
	Update(0);
}

function OnTarget()
{
	return onTarget;
}