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