/// @description Insert description here
// You can write your code in this editor

commands = [
	PORTRAITS(spr_andy_dialogue_neutral, spr_andy_dialogue_neutral, false, false),
	TEXT("Howdy, world!"),
	PORTRAITS(spr_andy_dialogue_annoyed, spr_andy_dialogue_sad, true, false),
	TEXT("This block of text should hopefully go to the next line because it's super duper long and stuff and hey did you know that nerf grenades exist?"),
	TEXT("That's all!")
];

StartDialogue(commands);