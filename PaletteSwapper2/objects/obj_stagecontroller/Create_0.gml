/// @description Insert description here
// You can write your code in this editor

inSpecialStage = (room == rm_sunsetstreet_special);
initPaintDropCount = instance_number(obj_paintdrop);
startTime = 0;	// The snapshot of time to make sure the bonus objective fulfillment stays on screen for the designated amount of time
fulfillmentDuration = 1; // The number of seconds to keep the fulfillment on screen
endTime = startTime + fulfillmentDuration;
soundplayed = false;	// Determines if the key sound has played yet

if !inSpecialStage
{
	time = 0;
	threshold = 240;
	bonusObjFulfilled = false;
	activeBonusObj = -1;
	criteriaString = ""
	playerDashed = false;
}
else
{
	activeSpecialStageObjectives = [-1, -1, -1];
	roundTimers = [80, 70, 60];
	activeBonusObj = -1;
}

enum bonusObjectives
{
	allStars,
	allPaintDrops,
	goldEnemy,
	noDashing,
	reverseBigDrops,
	noHitBoss,
}