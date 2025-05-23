/// @description Insert description here
// You can write your code in this editor

onScreen = onScreen || levelConfirmed;

if (onScreen)
{
	yy = lerp(yy, display_get_gui_height() / 2, slideAmt);
}
else
{
	confirmDelay = 4;
	yy = lerp(yy, display_get_gui_height() * 2, slideAmt);
	
	if round(yy) = display_get_gui_height() * 2
	{
		instance_destroy();	
	}
}

if (confirmDelay > 0) {
	confirmDelay -= 1;
}
else if ( obj_player_worldmap.keyConfirm && !levelConfirmed )
{
	levelConfirmed = true;
	audio_stop_all();
	audio_play_sound(snd_menuselection, 0, false, global.gain_sfx);
	//room_goto(node.myStage);
	with (instance_create_layer(0, 0, "Instances", obj_transition))
	{
		target_room = other.node.myStage;
	}
}

with node
{
	other.star1 = self.star1;
	other.star2 = self.star2;
	other.star3 = self.star3;
	other.key = self.key;
}
