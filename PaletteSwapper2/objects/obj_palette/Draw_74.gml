/// @description Insert description here
// You can write your code in this editor

// Draw Setup
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
pal_swap_reset();

//Palette variables
draw_set_circle_precision(32);
draw_circle_color(xx, yy, 32, c_white, c_white, false);

//Paint variables
var rad = 6;

#region DRAW AVAILABLE COLORS

var _colorindex;

for (var i = 0; i < colorCount; i++)
{
	_colorindex = colorDrawOrder[i];
	
	if ( array_has_value(colorList, _colorindex) )	// i + first used index
	{
		draw_circle_color(
			xx + padding * ((i  %  3)-1),
			yy + padding * ((i div 3)-1),
			rad,
			colorDrawColor[_colorindex],
			colorDrawColor[_colorindex],
			false
			)
	}
}

#endregion

var _x = xx, _y = yy;
var _theta;

var _spr = spr_ui_colselect_disc;
var _uvs = sprite_get_uvs(spr_ui_colselect_disc, 0);
var _xoff = sprite_get_xoffset(_spr);

if 0
{
	var _x = xx, _y = yy;
	var _theta;

	draw_sprite_ext(spr_ui_colselect_bk, 1, _x, _y+1, 1, 1, paintthetadraw, c_white, 1);
	draw_sprite_ext(spr_ui_colselect_bk, 0, _x, _y, 1, 1, paintthetadraw, c_white, 1);

	for (var i = 0; i < colorCount; i++)
	{
		_colorindex = colorDrawOrder[i];
	
		if ( array_has_value(colorList, _colorindex) )	// i + first used index
		{
			_theta = paintthetadraw + lerp(360, 250, i/colorCount);
		
			draw_sprite_ext(
				spr_ui_colselect_paint,
				1,
				_x + lengthdir_x(36, _theta),
				_y + lengthdir_y(36, _theta),
				1, 1, 0, colorDrawColor[_colorindex], 1
			);
		
		}
	}
}
