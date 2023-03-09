/// @description Insert description here
// You can write your code in this editor
slideAmt = 0.09;
destNode = noone;
isMoving = false;
possibleDests = ds_list_create();
canMove = true;

shakeTime = 0;	// Used to shake player when doing an invalid move
shakeDirection = 0;	// Angle to shake against

