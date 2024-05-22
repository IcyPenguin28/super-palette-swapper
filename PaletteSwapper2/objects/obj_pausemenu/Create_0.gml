/// @description Insert description here
// You can write your code in this editor

// The list of all submenus the options screen can go to
enum pausemenu
{
	resume,
	options,
	title
}

// Grab screen and freeze all instances
if (!global.paused)
{
	global.paused = true;
	pause_surface = surface_create(surface_get_width(application_surface), surface_get_height(application_surface));
	surface_copy(pause_surface, 0, 0, application_surface);
	instance_deactivate_all(true);	
}

// Determines where you are in the menu
pos = pausemenu.resume;

// Used for wrapping
maxpos = pausemenu.title;

// Used for GUI displaying
hPadding = sprite_width * 2;
vPadding = sprite_height * 3;

// Display text for each choice
optionsText[pausemenu.resume] = "Resume Game";
optionsText[pausemenu.options] = "Options";
if (room == rm_worldmap)
{
	optionsText[pausemenu.title] = "Return to Title Screen";
}
else
{
	optionsText[pausemenu.title] = "Return to World Map";
}


// Display position for each choice
optionsY[pausemenu.resume] = y;
optionsY[pausemenu.options] = y + vPadding;
optionsY[pausemenu.title] = y + 2*vPadding;