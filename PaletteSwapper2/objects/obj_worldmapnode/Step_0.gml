/// @description Insert description here
// You can write your code in this editor
// Switch to the correct sprite
switch (clearStatus)
{
	case 0:
		if myStage != noone
		{
			if unlocked
			{
				sprite_index = spr_worldmapnode_unplayed;
			}
			else
			{
				sprite_index = spr_worldmapnode_inaccessible;
			}
		}
		else
		{
			visible = false;
		}
		break;
	case 1:
		if star1 && star2 && star3 && key
		{
			sprite_index = spr_worldmapnode_completed;
		}
		else
		{
			sprite_index = spr_worldmapnode_beaten;
		}
}