/// @description Insert description here
// You can write your code in this editor

if global.gp_device == -1
{
	msg = "I just have to press the C key to dash!";
	msg2 = "Yesterday's lecture said something about using the SHIFT key while I'm equipped with a paint to use it for self-defense.";
}
else if global.gp_desc == "Nintendo Switch Pro Controller"
{
	msg = "I just have to press A to dash!";
	msg2 = "Yesterday's lecture said something about using the X button while I'm equipped with a paint to use it for self-defense.";
}
else if global.gp_desc == "XInput STANDARD GAMEPAD"
{
	msg = "I just have to press B to dash!";
	msg2 = "Yesterday's lecture said something about using the Y button while I'm equipped with a paint to use it for self-defense.";
}
else
{
	msg = "I just have to press the east face button to dash!";
	msg2 = "Yesterday's lecture said something about using the north face button while I'm equipped with a paint to use it for self-defense.";
}

commands = [
	PORTRAITS(spr_andy_dialogue_annoyed, noone, false, false),
	TEXT("What?! No way! How did those cloud things get across THIS?!"),
	PORTRAITS(spr_andy_dialogue_inquisitive, noone, false, false),
	TEXT("Well, I guess if they are clouds, I guess that means some of them can float..."),
	PORTRAITS(spr_andy_dialogue_sad, noone, false, false),
	TEXT("But then how am I supposed to...?"),
	PORTRAITS(spr_andy_dialogue_happy, noone, false, false),
	TEXT("OH! I still have my Red Paint! I can just use it to dash across."),
	TEXT(msg),
	PORTRAITS(spr_andy_dialogue_inquisitive, noone, false, false),
	TEXT(msg2),
	TEXT("I wonder what the red paint gives me to use in that regard?"),
];

StartDialogue(commands);