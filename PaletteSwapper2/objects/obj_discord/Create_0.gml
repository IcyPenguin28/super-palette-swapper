/// @description Set up Discord RPC
// You can write your code in this editor

#macro DISCORD_CLIENT_ID "1050995686746886267"

ready = false;
if !np_initdiscord(DISCORD_CLIENT_ID, true, np_steam_app_id_empty)
{
	show_error("NekoPresence init fail", true);
}