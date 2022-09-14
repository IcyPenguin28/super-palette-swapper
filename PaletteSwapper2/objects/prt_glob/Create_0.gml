/// @description Insert description here
// You can write your code in this editor
if (instance_exists(obj_player))
{
	dir = sign(obj_player.image_xscale);
}
else
{
	dir = 1;
}

spd = 12;
hsp = 0;
vsp = 0;
grav = 0.6;