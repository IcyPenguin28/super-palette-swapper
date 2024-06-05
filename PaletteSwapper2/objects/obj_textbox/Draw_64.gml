/// @description Insert description here
// You can write your code in this editor

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_black);
draw_set_alpha(bgAlpha);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);


draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_color(c_white);
if portraitL != noone
{
	draw_sprite_ext(portraitL, 0, portraitLX, portraitLY, portraitScale, portraitScale, 0, c_white, 1);
}

if portraitR != noone
{
	draw_sprite_ext(portraitR, 0, portraitRX, portraitRY, -portraitScale, portraitScale, 0, c_white, 1);	
}
draw_sprite_stretched(sprite_index, 0, x, y, width, height);


if !opening && !closing
{
	draw_set_halign(fa_left);
	draw_set_color(textColor);
	draw_set_font(textFont);
	draw_set_alpha(1);
	scr_type(x + textX, y + textY, text, textProgress, textWidth);
}
