/// @description Insert description here
// You can write your code in this editor

if !instance_exists(obj_results) && !inSpecialStage
{
	if (alarm[0] == -1) alarm[0] = room_speed;
}


// Bonus Objective Stuff
if !inSpecialStage
{
	switch (activeBonusObj)
	{
		case bonusObjectives.allStars:
			criteriaString = "Collect all 3 stars";
			if instance_exists(obj_results)
			{
				with (obj_results)
				{
					if star1Filled && star2Filled && star3Filled
					{
						bonusObjFulfilled = true;
					}
				}
			}
			break;
		case bonusObjectives.allPaintDrops:
			criteriaString = "Collect all " + string(initPaintDropCount) + " paint drops";
			if instance_number(obj_paintdrop) == 0
			{
				bonusObjFulfilled = true;
			}
			break;
		case bonusObjectives.goldEnemy:
			criteriaString = "Defeat the elusive golden enemy";
			if !instance_exists(obj_dropling_gold)
			{
				bonusObjFulfilled = true;
			}
			break;
		case bonusObjectives.noDashing:
			criteriaString = "Clear the level without dashing";
			if instance_exists(obj_player)
			{
				if obj_player.isDashing
				{
					playerDashed = true;
				}
			}
			bonusObjFulfilled = !playerDashed;
			break;
		case bonusObjectives.reverseBigDrops:
			criteriaString = "Collect all three big paint drops in reverse order";
			var counter = 0;
			if instance_exists(obj_player)
			{
				if (!obj_player.collectedBigDrops[0] && !obj_player.collectedBigDrops[1] && obj_player.collectedBigDrops[2] && counter == 0) counter++;
				if (!obj_player.collectedBigDrops[0] && obj_player.collectedBigDrops[1] && obj_player.collectedBigDrops[2] && counter == 1) counter++;
				if (obj_player.collectedBigDrops[0] && !obj_player.collectedBigDrops[1] && obj_player.collectedBigDrops[2] && counter == 2) counter++;
				if (counter == 3) bonusObjFulfilled = true;
			}
			break;
	}
}


if inSpecialStage
{
	
}