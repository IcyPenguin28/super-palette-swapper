/// @description Insert description here
// You can write your code in this editor

inSpecialStage = (room == rm_sunsetstreet_special);
initPaintDropCount = instance_number(obj_paintdrop);
getStartTime = true;	// Flag will be set to false when start time is set. Prevents resetting it over and over in Draw GUI.
startTime = 0;	// The snapshot of time to make sure the bonus objective fulfillment stays on screen for the designated amount of time
fulfillmentDuration = 2; // The number of seconds to keep the fulfillment on screen
endTime = startTime + fulfillmentDuration;
soundplayed = false;	// Determines if the key sound has played yet
ini_open(global.active_savefile);
alreadyGotKey = ini_read_real(room_get_name(room), "key", 0);
ini_close();

if !inSpecialStage
{
	time = 0;
	threshold = 240;
	ini_open(global.active_savefile);
	bonusObjFulfilled = ini_read_real(room_get_name(room), "key", 0);
	ini_close();
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
	allStars,			// Get all 3 stars for the level
	allPaintDrops,		// Collect all the paint drops in the level
	goldEnemy,			// Defeat the golden enemy
	noDashing,			// Don't dash
	reverseBigDrops,	// Collect the big drops in reverse order
	noHitBoss,			// Don't get hit when fighting the boss
}