/// @description Insert description here
// You can write your code in this editor


// The list of options in this menu
enum videomenu
{
	scale
}

// Used as display values when inside the menu itself.
// Whatever these values are changed to is what is written back into the INI
// Open options INI to read currently saved values
ini_open(global.options_file);
scale = ini_read_real("Video", "Scale", 2);
ini_close();

// Determines where you are in the menu
pos = videomenu.scale;

// Used for wrapping
maxpos = videomenu.scale;

// Used for GUI displaying
hPadding = sprite_width * 2;
vPadding = sprite_height * 3;

// Display text for each choice
optionsText[videomenu.scale] = "Scale Factor: < "+string(scale)+"x >";

// Display position for each choice
optionsY[videomenu.scale] = y;