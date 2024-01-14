/// @description Insert description here
// You can write your code in this editor

// Determines if the options menu can be toyed with
canInteract = false;

// The list of all submenus the options screen can go to
enum optionsmenu
{
	audio,
	video,
	// keybinds,
	// gamepad,
}

// Determines where you are in the menu
pos = optionsmenu.audio;

// Used for wrapping
maxpos = optionsmenu.video;

// Used for GUI displaying
hPadding = sprite_width * 2;
vPadding = sprite_height * 3;

// Display text for each choice
optionsText[optionsmenu.audio] = "Audio";
optionsText[optionsmenu.video] = "Video";
// optionsText[optionsmenu.keybinds] = "Keybinds";
// optionsText[optionsmenu.gamepad] = "Gamepad Controls";

// Display position for each choice
optionsY[optionsmenu.audio] = y;
optionsY[optionsmenu.video] = y + vPadding;
// optionsY[optionsmenu.keybinds] = y + 2*vPadding;
// optionsY[optionsmenu.gamepad] = y + 3*vPadding;