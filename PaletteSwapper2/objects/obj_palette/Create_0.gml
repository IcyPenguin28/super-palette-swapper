/// @description Insert description here
// You can write your code in this editor

enum PlayerPaintColors
{
	empty,
	white,
	red,
	yellow,
	green,
	blue,
}

colorList = array_create(5, PlayerPaintColors.empty);
activeSlot = 0;

paintorder = [
	
];

image_speed = (2/15);

// Populate palette with unlocked colors by reading save file

array_set(colorList, 0, PlayerPaintColors.white);

ini_open(global.active_savefile);

if (ini_read_real("Unlocked Colors", string(PlayerPaintColors.red), 0)) || true
{
	array_set(colorList, 1, PlayerPaintColors.red);	
}

if (ini_read_real("Unlocked Colors", string(PlayerPaintColors.yellow), 0)) || true
{
	array_set(colorList, 2, PlayerPaintColors.yellow);	
}

if (ini_read_real("Unlocked Colors", string(PlayerPaintColors.green), 0)) || true
{
	array_set(colorList, 3, PlayerPaintColors.green);	
}

if (ini_read_real("Unlocked Colors", string(PlayerPaintColors.blue), 0)) || true
{
	array_set(colorList, 4, PlayerPaintColors.blue);	
}

ini_close();

// Create cursor
xx = 48;
yy = 64;
padding = 32;
// cursor = instance_create_depth(xx, yy, -5, obj_palette_cursor);

colorCount = 5;

colorDrawColor = array_create(colorCount);
colorDrawColor[PlayerPaintColors.red] = c_red;
colorDrawColor[PlayerPaintColors.yellow] = c_yellow;
colorDrawColor[PlayerPaintColors.green] = make_color_rgb(59, 156, 0);
colorDrawColor[PlayerPaintColors.blue] = c_blue;
colorDrawColor[PlayerPaintColors.white] = c_white;

colorDrawOrder = [
	PlayerPaintColors.white,
	PlayerPaintColors.red,
	PlayerPaintColors.yellow,
	PlayerPaintColors.blue,
	PlayerPaintColors.green,
];

colorCoords = [
	[xx, yy],						// white
	[xx, yy - padding],				//red
	[xx + padding, yy],				//yellow
	[xx, yy + padding],				//green
	[xx - padding, yy],				//blue
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

function CalcNumColors()
{
	var numColors = 0;
	for (var i = 0; i < array_length(colorList) - 1; i++)
	{
		if colorList[i] != PlayerPaintColors.empty
		{
			numColors ++;
		}
	}
	
	return numColors;
}