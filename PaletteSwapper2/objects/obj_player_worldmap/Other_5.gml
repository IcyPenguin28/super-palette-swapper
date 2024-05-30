/// @description Insert description here
// You can write your code in this editor

// Update player spawn location when returning to world map
if (destNode != noone)
{
	ini_open(global.active_savefile);
	ini_write_real("World Map", "spawnNode", real(destNode.id));
	ini_close();
	show_debug_message("Wrote World Map data");
}

// Free memory
ds_list_destroy(possibleDests);