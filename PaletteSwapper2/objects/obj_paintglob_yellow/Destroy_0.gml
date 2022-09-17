/// @description Insert description here
// You can write your code in this editor

with (instance_create_layer(x, y, "Instances", obj_puddle_yellow))
{
	image_yscale = sign(other.grav);
}