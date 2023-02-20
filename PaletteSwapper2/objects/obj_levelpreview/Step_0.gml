/// @description Insert description here
// You can write your code in this editor


if onScreen
{
	yy = lerp(yy, display_get_gui_height() / 2, slideAmt);
}
else
{
	yy = lerp(yy, display_get_gui_height() * 2, slideAmt);
	
	if round(yy) = display_get_gui_height() * 2
	{
		instance_destroy();	
	}
}

if (round(yy) == display_get_gui_height() / 2) && obj_player_worldmap.keyConfirm
{
	audio_stop_all();
	audio_play_sound(snd_menuselection, 0, false);
	room_goto(node.myStage);
}

with node
{
	other.star1 = self.star1;
	other.star2 = self.star2;
	other.star3 = self.star3;
	other.key = self.key;
}