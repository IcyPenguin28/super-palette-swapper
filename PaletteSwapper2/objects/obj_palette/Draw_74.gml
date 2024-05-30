/// @description Insert description here
// You can write your code in this editor

// Draw Setup
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
pal_swap_reset();

//Palette variables
draw_set_circle_precision(32);
draw_circle_color(xx, yy, 46, c_black, c_black, false);
draw_circle_color(xx, yy, 45, c_white, colorDrawColor[activeSlot + 1], false);


//Paint variables
var rad = 6;

#region DRAW AVAILABLE COLORS

for (var i = 0; i < colorCount; i++)
{
	var _ind = colorDrawOrder[i];
	if (array_has_value(colorList, _ind))
	{
		draw_sprite_ext(
			spr_magicpaint,
			activeSlot + 1 == _ind ? image_index : 0, 
			colorCoords[_ind - 1][0],
			colorCoords[_ind - 1][1],
			activeSlot + 1 == _ind ? 1.5 : 1, 
			activeSlot + 1 == _ind ? 1.5 : 1,
			0,
			colorDrawColor[_ind],
			1
		);
	}
}

#endregion