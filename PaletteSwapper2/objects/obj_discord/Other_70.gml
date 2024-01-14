/// @description Insert description here
// You can write your code in this editor

var ev_type = async_load[? "event_type"]

if (ev_type == "DiscordReady")
{
	ready = true;
	np_setpresence_more("", "", false);
	np_setpresence_timestamps(date_current_datetime(), 0, false);
	
	// Reminder that np_setpresence is the last function to call when executing a presence change
	np_setpresence("In Menus", "", "menu", "")
}