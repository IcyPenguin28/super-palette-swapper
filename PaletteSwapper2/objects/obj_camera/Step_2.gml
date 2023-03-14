/// @description Insert description here

camX = camera_get_view_x(cam);
camY = camera_get_view_y(cam);

camW = camera_get_view_width(cam);
camH = camera_get_view_height(cam);

// Determine target
switch(state)
{
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

// Calculate final position
locationtarget[0] = clamp(locationtarget[0], 0, room_width-wRes);
locationtarget[1] = clamp(locationtarget[1], 0, room_height-hRes);

locationintermediate[0] = lerp(locationintermediate[0], locationtarget[0], panSpd);
locationintermediate[1] = lerp(locationintermediate[1], locationtarget[1], panSpd);

location[0] = lerp(location[0], locationintermediate[0], panSpd);
location[1] = lerp(location[1], locationintermediate[1], panSpd);

// Apply position
camX = location[0];
camY = location[1];

camera_set_view_pos(cam,camX,camY);