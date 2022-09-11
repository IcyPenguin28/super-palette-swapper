/// @description Insert description here
// You can write your code in this editor
enum colors
{
	empty,
	red,
	orange,
	yellow,
	green,
	cyan,
	blue,
	indigo,
	purple
}

colorList = array_create(9, colors.empty);
activeSlot = 0;

// These are here for debugging and testing what a full palette would be.
// Comment out any colors you want to deactivate
array_set(colorList, 0, colors.empty);
array_set(colorList, 1, colors.red);
array_set(colorList, 2, colors.orange);
array_set(colorList, 3, colors.yellow);
array_set(colorList, 4, colors.green);
array_set(colorList, 5, colors.cyan);
array_set(colorList, 6, colors.blue);
array_set(colorList, 7, colors.indigo);
array_set(colorList, 8, colors.purple);