/// @description Insert description here
// You can write your code in this editor
camX = camera_get_view_x(cam);
camY = camera_get_view_y(cam);

camW = camera_get_view_width(cam);
camH = camera_get_view_height(cam);

if instance_exists(obj_player)
{
	var targetX = obj_player.x - (wRes/2);
	var targetY = obj_player.y - (hRes/2);
}
else
{
	if !instance_exists(obj_camera_target)
	{
		instance_create_layer(camX, camY, "Instances", obj_camera_target);
	}
	var targetX = obj_camera_target.x - (wRes/2);
	var targetY = obj_camera_target.y - (hRes/2);
}

targetX = clamp(targetX,0,room_width-wRes);
targetY = clamp(targetY,0,room_width-hRes);

camX = lerp(camX,targetX,panSpd);
camY = lerp(camY,targetY,panSpd);

camera_set_view_pos(cam,camX,camY);