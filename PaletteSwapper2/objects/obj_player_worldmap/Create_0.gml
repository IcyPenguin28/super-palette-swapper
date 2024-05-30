/// @description Insert description here
// You can write your code in this editor
slideAmt = 0.09;
destNode = noone;
isMoving = false;
possibleDests = ds_list_create();
canMove = true;

shakeTime = 0;	// Used to shake player when doing an invalid move
shakeDirection = 0;	// Angle to shake against


// Spawn player on node of the level they just exited from
ini_open(global.active_savefile);
spawnNode = ini_read_real("World Map", "spawnNode", -4);
ini_close();

if (spawnNode != -4)
{
	// Find the instance with the stored instance ID
	for (var i = 0; i < instance_count; i++)
	{
		if instance_id[i] == spawnNode
		{
			spawnNode = instance_id_get(i);
			break;
		}
	}
	
	x = spawnNode.x;
	y = spawnNode.y;
}