/// @description Insert description here
// You can write your code in this editor

inSpecialStage = (room == rm_sunsetstreet_special)

palette = instance_create_layer(0, 0, "Instances", obj_palette);
hp_ind = instance_create_layer(0, 0, "Instances", obj_hp_indicator);
drop_ind = instance_create_layer(0, 0, "Instances", obj_paintdrop_indicator);


if !inSpecialStage
{
	bucket_ind = instance_create_layer(0, 0, "Instances", obj_paintbucket_indicator);
	bigdrop_ind = instance_create_layer(0, 0, "Instances", obj_bigpaintdrop_indicator);	
}

function HideUI()
{
	bigdrop_ind.onScreen = false;
	hp_ind.onScreen = false;
	bucket_ind.onScreen = false;
	drop_ind.onScreen = false;
}


function ShowUI()
{
	bigdrop_ind.onScreen = true;
	hp_ind.onScreen = true;
	bucket_ind.onScreen = true;
	drop_ind.onScreen = true;
}