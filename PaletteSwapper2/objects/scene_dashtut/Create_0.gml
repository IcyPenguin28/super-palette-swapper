/// @description Insert description here
// You can write your code in this editor

if global.gp_device == -1
{
	msg = "All I have to do is rotate through the available colors on my palette with the A and S keys...";
	msg2 = "...and then press the C key when I'm red and airborne!";
}
else if global.gp_desc == "Nintendo Switch Pro Controller"
{
	msg = "All I have to do is rotate through the available colors on my palette with L and R.";
	msg2 = "...and then press A when I'm red and airborne!";
}
else if global.gp_desc == "XInput STANDARD GAMEPAD"
{
	msg = "All I have to do is rotate through the available colors on my palette with LB and RB.";
	msg2 = "...and then press B when I'm red and airborne!";
}
else
{
	msg = "All I have to do is rotate through the available colors on my palette with the shoulder bumpers.";
	msg2 = "...and then press the action button when I'm red and airborne!";
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
	TEXT(msg2),
];

StartDialogue(commands);