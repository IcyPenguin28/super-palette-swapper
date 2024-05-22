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

image_speed = (2/15);

// Populate palette with unlocked colors by reading save file

array_set(colorList, 0, PlayerPaintColors.white);

ini_open(global.active_savefile);

if (ini_read_real("Unlocked Colors", string(PlayerPaintColors.red), 0))
{
	array_set(colorList, 1, PlayerPaintColors.red);	
}

if (ini_read_real("Unlocked Colors", string(PlayerPaintColors.orange), 0)) || true
{
	array_set(colorList, 2, PlayerPaintColors.orange);	
}

if (ini_read_real("Unlocked Colors", string(PlayerPaintColors.yellow), 0))
{
	array_set(colorList, 3, PlayerPaintColors.yellow);	
}

if (ini_read_real("Unlocked Colors", string(PlayerPaintColors.green), 0))
{
	array_set(colorList, 4, PlayerPaintColors.green);	
}

if (ini_read_real("Unlocked Colors", string(PlayerPaintColors.cyan), 0))
{
	array_set(colorList, 5, PlayerPaintColors.cyan);	
}

if (ini_read_real("Unlocked Colors", string(PlayerPaintColors.blue), 0)) || true
{
	array_set(colorList, 6, PlayerPaintColors.blue);	
}

if (ini_read_real("Unlocked Colors", string(PlayerPaintColors.indigo), 0))
{
	array_set(colorList, 7, PlayerPaintColors.indigo);	
}

if (ini_read_real("Unlocked Colors", string(PlayerPaintColors.purple), 0))
{
	array_set(colorList, 8, PlayerPaintColors.purple);	
}

ini_close();

// Create cursor
xx = 48;
yy = 64;
padding = 20;
// cursor = instance_create_depth(xx, yy, -5, obj_palette_cursor);

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