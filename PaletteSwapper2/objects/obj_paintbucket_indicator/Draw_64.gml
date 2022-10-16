/// @description Insert description here
// You can write your code in this editor

var p = obj_player;
var c = obj_camera;

if instance_exists(p)
{
	draw_sprite(spr_paintbucket_indicator, p.hasPaintBucket, 48, c.camH - 48);
}