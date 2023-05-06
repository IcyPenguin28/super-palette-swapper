/// @description Insert description here
// You can write your code in this editor
if !instance_exists(myScene)
{
	instance_create_layer(0, 0, "Instances", myScene);	
}

instance_destroy();