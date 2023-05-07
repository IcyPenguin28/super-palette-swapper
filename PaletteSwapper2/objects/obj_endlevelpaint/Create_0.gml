/// @description Insert description here
// You can write your code in this editor

myCol = PlayerPaintColors.red;	// The color to add to the palette
paletteIndex = 1;	// In rainbow order starting with red as 1
sprite_index = spr_paintglob_red;	// Sprite visible to the player

stageCleared = false; // True when the player clears the stage
stepFlag = false; // Is set to true (and never goes back to false) when all events in the step for stage clear are finished