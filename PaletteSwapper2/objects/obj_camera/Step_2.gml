/// @description Insert description here
// You can write your code in this editor
var camX = camera_get_view_x(cam);
var camY = camera_get_view_y(cam);

var camW = camera_get_view_width(cam);
var camH = camera_get_view_height(cam);

var targetX = obj_player.x - (wRes/2);
var targetY = obj_player.y - (hRes/2);

targetX = clamp(targetX,0,room_width-wRes);
targetY = clamp(targetY,0,room_width-hRes);

camX = lerp(camX,targetX,panSpd);
camY = lerp(camY,targetY,panSpd);

camera_set_view_pos(cam,camX,camY);