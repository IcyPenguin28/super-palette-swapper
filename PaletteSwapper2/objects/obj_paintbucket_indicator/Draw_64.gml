/// @description Insert description here
// You can write your code in this editor

var p = obj_player;

if onScreen
{
	xx = lerp(xx, originalXX, slideSpd);
}
else
{
	xx = lerp(xx, -48, slideSpd);
}

if instance_exists(p)
{
	draw_sprite(spr_paintbucket_indicator, p.hasPaintBucket, xx, yy);
}