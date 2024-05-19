/// @description Insert description here
// You can write your code in this editor

if shrinking
{
	// Transition start: Shrink circle
	if (rad > 0)
	{
		rad -= spd;
	}
	else
	{
		room_goto(target_room);
		shrinking = false;
	}
}
else
{
	// Transition end: Grow circle
	if (rad <= max(width, height))
	{
		rad += spd;
	}
	else
	{
		instance_destroy();	
	}
}