/// @description Insert description here
// You can write your code in this editor

// Determines if the options menu can be toyed with
canInteract = false;

// The list of all submenus the options screen can go to
enum optionsmenu
{
	main,
	audio,
	visuals,
	controls,
	
}

// Determines which submenu is currently being displayed
activeMenu = optionsmenu.main;

// Str arr that contains the choices within the active menu
choices = [];