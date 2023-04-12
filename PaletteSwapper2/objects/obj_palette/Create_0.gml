/// @description Insert description here
// You can write your code in this editor

enum PlayerPaintColors
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

colorList = array_create(9, PlayerPaintColors.empty);
activeSlot = 0;

paintorder = [
	
];

// These are here for debugging and testing what a full palette would be.
// Comment out any colors you want to deactivate

array_set(colorList, 0, PlayerPaintColors.white);
array_set(colorList, 1, PlayerPaintColors.red);
array_set(colorList, 2, PlayerPaintColors.orange);
array_set(colorList, 3, PlayerPaintColors.yellow);
//array_set(colorList, 4, PlayerPaintColors.green);
//array_set(colorList, 5, PlayerPaintColors.cyan);
array_set(colorList, 6, PlayerPaintColors.blue);
//array_set(colorList, 7, PlayerPaintColors.indigo);
//array_set(colorList, 8, PlayerPaintColors.purple);

// Create cursor
xx = 48;
yy = 64;
padding = 18;
cursor = instance_create_depth(xx, yy, -10000, obj_palette_cursor);

colorCount = 9;

colorDrawColor = array_create(colorCount);
colorDrawColor[PlayerPaintColors.red] = c_red;
colorDrawColor[PlayerPaintColors.orange] = c_orange;
colorDrawColor[PlayerPaintColors.yellow] = c_yellow;
colorDrawColor[PlayerPaintColors.green] = c_green;
colorDrawColor[PlayerPaintColors.cyan] = c_aqua;
colorDrawColor[PlayerPaintColors.blue] = c_blue;
colorDrawColor[PlayerPaintColors.indigo] = $8F00FF;
colorDrawColor[PlayerPaintColors.purple] = c_purple;
colorDrawColor[PlayerPaintColors.white] = c_white;

colorDrawOrder = [
	PlayerPaintColors.purple,
	PlayerPaintColors.red,
	PlayerPaintColors.orange,
	PlayerPaintColors.indigo,
	PlayerPaintColors.white,
	PlayerPaintColors.yellow,
	PlayerPaintColors.blue,
	PlayerPaintColors.cyan,
	PlayerPaintColors.green,
];

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

painttheta = 0;	// Final value
paintthetadraw = 0;	// Used in draw call
paintthetarange = [360, 270];
paintthetasep = 10;

function move_palette_cursor(tx, ty)
{
	with (obj_palette_cursor)
	{
		targetX = tx;
		targetY = ty;
	}
}
