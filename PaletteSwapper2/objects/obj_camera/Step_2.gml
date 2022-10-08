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
	var targetX = camX;
	var targetY = camY;
}

targetX = clamp(targetX,0,room_width-wRes);
targetY = clamp(targetY,0,room_width-hRes);

camX = lerp(camX,targetX,panSpd);
camY = lerp(camY,targetY,panSpd);

camera_set_view_pos(cam,camX,camY);