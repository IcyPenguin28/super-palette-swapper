/// @description Insert description here
// You can write your code in this editor
draw_set_alpha(a);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_rectangle_color(0, 0, display_get_gui_width(), display_get_gui_height(), c_white, c_white, c_white, c_white, false);

if !star1Filled
{
	draw_sprite_ext(spr_star_empty, 0, starx1, stary, scale1, scale1, 0, c_white, 1);
}
else
{
	draw_sprite_ext(spr_star_filled, image_index, starx1, stary, scale1, scale1, 0, c_white, 1);
}

if !star2Filled
{
	draw_sprite_ext(spr_star_empty, 0, starx2, stary, scale2, scale2, 0, c_white, 1);
}
else
{
	draw_sprite_ext(spr_star_filled, image_index, starx2, stary, scale2, scale2, 0, c_white, 1);
}

if !star3Filled
{
	draw_sprite_ext(spr_star_empty, 0, starx3, stary, scale3, scale3, 0, c_white, 1);
}
else
{
	draw_sprite_ext(spr_star_filled, image_index, starx3, stary, scale3, scale3, 0, c_white, 1);
}

if !keyFilled
{
	draw_sprite_ext(spr_key_empty, 0, starx2, keyY, scale4, scale4, 0, c_white, 1);
}
else
{
	draw_sprite_ext(spr_key_filled, image_index, starx2, keyY, scale4, scale4, 0, c_white, 1);
}

if canContinue
{
	draw_set_font(fnt_goal);
	draw_text_color(starx2, display_get_gui_height() - 32 + 4, "Press Z", c_black, c_black, c_black, c_black, 1);
	draw_text_color(starx2, display_get_gui_height() - 32, "Press Z", c_gray, c_gray, c_gray, c_gray, 1);
}