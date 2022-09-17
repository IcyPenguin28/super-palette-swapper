/// @description Insert description here
// You can write your code in this editor

enum colors
{
	empty,
	white,
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

array_set(colorList, 0, colors.white);
array_set(colorList, 1, colors.red);
array_set(colorList, 2, colors.orange);
array_set(colorList, 3, colors.yellow);
//array_set(colorList, 4, colors.green);
//array_set(colorList, 5, colors.cyan);
array_set(colorList, 6, colors.blue);
//array_set(colorList, 7, colors.indigo);
//array_set(colorList, 8, colors.purple);

// Create cursor
xx = 48;
yy = 64;
padding = 18;
instance_create_depth(xx, yy, -10000, obj_palette_cursor);

colorCoords = [
	[xx, yy],						// empty
	[xx, yy - padding],				//red
	[xx + padding, yy - padding],	//orange
	[xx + padding, yy],				//yellow
	[xx + padding, yy + padding],	//green
	[xx, yy + padding],				//cyan
	[xx - padding, yy + padding],	//blue
	[xx - padding, yy],				//indigo
	[xx - padding, yy - padding]	//purple
];

function move_palette_cursor(tx, ty)
{
	with (obj_palette_cursor)
	{
		targetX = tx;
		targetY = ty;
	}
}
