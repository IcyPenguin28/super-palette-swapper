/// @description Insert description here
// You can write your code in this editor

// Re-initialize vars that could have changed in creation code
myStageStr = room_get_name(myStage);

show_debug_message(global.active_savefile);

if file_exists(global.active_savefile)
{
	ini_open(global.active_savefile)
	clearStatus = ini_read_real(myStageStr, "cleared", 0);
	star1 = ini_read_real(myStageStr, "star1", 0);
	star2 = ini_read_real(myStageStr, "star2", 0);
	star3 = ini_read_real(myStageStr, "star3", 0);
	key = ini_read_real(myStageStr, "key", 0);
	ini_close();
}

// Determine if other nodes are unlocked
if clearStatus == 1
{
	for (var i = 0; i < instance_number(obj_worldmapnode); i++)
	{
		var node = instance_find(obj_worldmapnode, i);
		if (node != id)
		{
			if array_has_value(unlocks, node.myStage)
			{
				// Code never reaches here for some reason
				show_debug_message(node);
				node.unlocked = true;
			}
		}
	}
}