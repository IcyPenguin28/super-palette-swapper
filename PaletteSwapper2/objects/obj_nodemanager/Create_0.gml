/// @description Insert description here
// You can write your code in this editor
for (var i = 0; i < instance_number(obj_worldmapnode); i++)
{
	var node = instance_find(obj_worldmapnode, i);
	with (node)
	{
		event_user(0);
	}
}