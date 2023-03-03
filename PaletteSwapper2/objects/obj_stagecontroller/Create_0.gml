/// @description Insert description here
// You can write your code in this editor

inSpecialStage = (room == rm_sunsetstreet_special);

if !inSpecialStage
{
	time = 0;
	threshold = 240;
	bonusObjFulfilled = true;
	activeBonusObj = -1;
	criteriaString = ""
	playerDashed = false;
}
else
{
	activeSpecialStageObjectives = [-1, -1, -1];
	roundTimers = [80, 70, 60];
}

enum bonusObjectives
{
	allStars,
	goldEnemy,
	noDashing,
	reverseDrops,
	noHitBoss,
}