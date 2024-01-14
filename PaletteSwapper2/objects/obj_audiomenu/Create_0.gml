/// @description Insert description here
// You can write your code in this editor


// The list of options in this menu
enum audiomenu
{
	bgm,
	sfx,
	// voice
}

// Used as display values when inside the menu itself.
// Whatever these values are changed to is what is written back into the INI
// Open options INI to read currently saved values
ini_open(global.options_file);
bgm_vol = ini_read_real("Audio", "BGM Volume", 0.5);
sfx_vol = ini_read_real("Audio", "SFX Volume", 1);
ini_close();

// Determines where you are in the menu
pos = audiomenu.bgm;

// Used for wrapping
maxpos = audiomenu.sfx;

// Used for GUI displaying
hPadding = sprite_width * 2;
vPadding = sprite_height * 3;

// Display text for each choice
optionsText[audiomenu.bgm] = "BGM Volume: "+string(bgm_vol * 100)+"%";
optionsText[audiomenu.sfx] = "SFX Volume: "+string(sfx_vol * 100)+"%";
ini_close();

// Display position for each choice
optionsY[audiomenu.bgm] = y;
optionsY[audiomenu.sfx] = y + vPadding;