/// @description Insert description here
// You can write your code in this editor
event_inherited();

myCol = PlayerPaintColors.red;	// The color to add to the palette
paletteIndex = 1;	// In rainbow order starting with red as 1

stageCleared = false; // True when the player clears the stage
stepFlag = false; // Is set to true (and never goes back to false) when all events in the step for stage clear are finished

displayColor = array_create(8);
displayColor[PlayerPaintColors.red] = c_red;
displayColor[PlayerPaintColors.yellow] = c_yellow;
displayColor[PlayerPaintColors.green] = c_green;
displayColor[PlayerPaintColors.blue] = c_blue;
displayColor[PlayerPaintColors.white] = c_white;