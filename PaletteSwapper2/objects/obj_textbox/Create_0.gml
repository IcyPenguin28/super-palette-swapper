/// @description Insert description here
// You can write your code in this editor
margin = 16;
padding = 8;
maxWidth = display_get_gui_width() - margin * 2;
width = 16;
height = sprite_height * 4;

bgAlpha = 0;
alphaSpeed = 0.05;

stretchSpeed = 0.2;

maxX = margin;
maxY = (display_get_gui_height() - height - margin);
x = (display_get_gui_width() - width) / 2;
y = display_get_gui_height();

textFont = fnt_dialogue;
textColor = c_white;
textSpeed = 0.6;
textX = padding;
textY = padding;
textWidth = maxWidth - padding * 2;

portraitL = noone;
portraitR = noone;
portraitScale = 0.5;
portraitLX = -320 * portraitScale;
portraitRX = display_get_gui_width() + 320;
portraitLXMax = display_get_gui_width() / 4;
portraitRXMax = display_get_gui_width() * (3/4);
portraitLY = display_get_gui_height() / 2 - 32;
portraitRY = portraitLY;

actions = []
currentAction = -1;

text = "";
textProgress = 0;
textLength = 0;

opening = true;
closing = false;

swappingL = false;
swappingR = false;

portraitLQueued = noone;
portraitRQueued = noone;

populateActions = function(actionArray)
{
	actions = actionArray;
	currentAction = -1;
	
	next();
}

next = function()
{
	currentAction ++;
	if (currentAction >= array_length(actions))
	{
		closing = true;
	}
	else
	{
		actions[currentAction].act(id);
	}
}

setText = function(newText)
{
	text = newText;
	textLength = string_length(newText);
	textProgress = 0;
}

setPortraits = function(sprL, sprR, swapL, swapR)
{	
	if swapL
	{
		portraitLQueued = sprL;
		swappingL = true;
	}
	else
	{
		portraitL = sprL;
	}
	
	if swapR
	{
		swappingR = true;
		portraitRQueued = sprR;
	}
	else
	{
		portraitR = sprR;
	}
}

with obj_ui
{
	HideUI();
}