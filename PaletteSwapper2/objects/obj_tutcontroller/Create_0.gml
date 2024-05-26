/// @description Insert description here
// You can write your code in this editor


// Player beat the tutorial level, no need to show them the button prompts again
if (instance_exists(obj_palette))
{
	if (array_has_value(obj_palette.colorList, PlayerPaintColors.red))
	{
		instance_destroy();
	}
}


moved = false;
jumped = false;
attacked = false;
slammed = false;

moveTimer = 300;
movestep = 0;

jumpTimer = 600;
jumpstep = 0;

attackTimer = 300;
attackstep = 0;

slamTimer = 300;
slamstep = 0;