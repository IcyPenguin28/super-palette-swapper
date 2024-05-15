/// @description Insert description here
// You can write your code in this editor

commands = [
	PORTRAITS(spr_andy_dialogue_inquisitive, noone, false, false),
	TEXT("Huh? What's this paint bucket doing here?"),
	PORTRAITS(spr_andy_dialogue_happy, noone, false, false),
	TEXT("I guess I should probably take it. Might come in handy if I find a blank canvas."),
	TEXT("The more canvases I paint, the more likely it is that I'll be able to keep my Champion titles."),
	PORTRAITS(spr_andy_dialogue_sad, noone, false, false),
	TEXT("The board would revoke those immediately if they found out I wasn't painting, let alone if they found out I lost two of the paints."),
	TEXT("..."),
	PORTRAITS(spr_andy_dialogue_determined, noone, false, false),
	TEXT("Which is exactly why I gotta press on and get my paints back!"),
	PORTRAITS(noone, noone, true, false),
	TEXT("This is a paint bucket. You need this to clear each stage."),
	TEXT("In every stage that does not end with a boss fight, you will need to bring the stage's paint bucket to the blank canvas positioned at the end of the stage."),
	TEXT("Normally, the paint bucket is hidden and you will have to explore around the stage to find it, but this one was left out in the open. How lucky!"),
];

StartDialogue(commands);