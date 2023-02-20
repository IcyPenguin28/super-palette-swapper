/// @description Insert description here
// You can write your code in this editor
myStage = rm_introstage;	// The level this node corresponds to, can be changed in creation code
myStageStr = room_get_name(myStage);	// The string representation for use in reading level data from ini
levelDisplayName = "Prologue - Memory Lane";
clearStatus = 0;	// 0 if unplayed or inaccessible. 1 if cleared or 100% completed.
unlocks = [rm_sunsetstreet1];	// The levels that are unlocked by clearing the stage on this node
unlocked = false;	// Determines if this particular node is unlocked itself
enum paths
{
	left,
	right,
	up,
	down
}

// Preview Colors
red = make_color_rgb(255, 106, 89);
orange = make_color_rgb(255, 153, 89);
yellow = make_color_rgb(255, 238, 89);
green = make_color_rgb(89, 255, 89);
cyan = make_color_rgb(89, 238, 255);
blue = make_color_rgb(89, 106, 255);
indigo = make_color_rgb(158, 89, 255);
purple = make_color_rgb(236, 89, 255);
gray = make_color_rgb(127, 127, 127);

previewCol = red;

connections = [paths.right];