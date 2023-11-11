/// @description Insert description here
// You can write your code in this editor

inSpecialStage = (room == rm_sunsetstreet_special)

palette = instance_create_layer(0, 0, "Instances", obj_palette);
hp_ind = instance_create_layer(0, 0, "Instances", obj_hp_indicator);

if !inSpecialStage
{
	bucket_ind = instance_create_layer(0, 0, "Instances", obj_paintbucket_indicator);
	bigdrop_ind = instance_create_layer(0, 0, "Instances", obj_bigpaintdrop_indicator);	
}

function HideUI()
{
	
}


function ShowUI()
{
	
}