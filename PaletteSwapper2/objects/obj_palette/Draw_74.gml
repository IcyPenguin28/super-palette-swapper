/// @description Insert description here
// You can write your code in this editor

// Draw Setup
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

//Palette variables
draw_set_circle_precision(32);
draw_circle_color(xx, yy, 32, c_white, c_white, false);

//Paint variables
var rad = 6;

#region DRAW AVAILABLE COLORS
if array_has_value(colorList, colors.red)
{
	draw_circle_color(xx, yy - padding, rad, c_red, c_red, false);
}

if array_has_value(colorList, colors.orange)
{
	draw_circle_color(xx + padding, yy - padding, rad, c_orange, c_orange, false);
}

if array_has_value(colorList, colors.yellow)
{
	draw_circle_color(xx + padding, yy, rad, c_yellow, c_yellow, false);
}

if array_has_value(colorList, colors.green)
{
	draw_circle_color(xx + padding, yy + padding, rad, c_green, c_green, false);
}

if array_has_value(colorList, colors.cyan)
{
	draw_circle_color(xx, yy + padding, rad, c_aqua, c_aqua, false);
}

if array_has_value(colorList, colors.blue)
{
	draw_circle_color(xx - padding, yy + padding, rad, c_blue, c_blue, false);
}

if array_has_value(colorList, colors.indigo)
{
	draw_circle_color(xx - padding, yy, rad, make_color_rgb(166, 0, 255), make_color_rgb(166, 0, 255), false);
}

if array_has_value(colorList, colors.purple)
{
	draw_circle_color(xx - padding, yy - padding, rad, c_purple, c_purple, false);
}

if array_has_value(colorList, colors.white)
{
	draw_circle_color(xx, yy, rad, c_white, c_black, true);
}
#endregion