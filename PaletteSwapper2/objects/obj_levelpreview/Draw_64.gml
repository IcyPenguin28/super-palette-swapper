/// @description Insert description here
// You can write your code in this editor
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_alpha(1);
draw_set_font(fnt_levelpreview);

var _width = display_get_gui_width() / 3;
var _height = display_get_gui_height() / 2;
var offset = 2;

// Draw Background
draw_rectangle_color(xx - _width, yy + _height, xx + _width, yy - _height, color, color, c_white, c_white, false);

// Draw Level Name
draw_set_color(c_black);
draw_text(xx, yy - _height + 32 + offset, node.levelDisplayName);
draw_set_color(c_white);
draw_text(xx, yy - _height + 32, node.levelDisplayName);

// Draw Star Count
var starScale = 2;
if star1
{
	draw_sprite_ext(spr_star_filled, image_speed, xx - sprite_get_width(spr_star_filled) * starScale, yy, starScale, starScale, 0, c_white, 1);
}
else
{
	draw_sprite_ext(spr_star_empty, image_speed, xx - sprite_get_width(spr_star_empty) * starScale, yy, starScale, starScale, 0, c_white, 1);
}

if star2
{
	draw_sprite_ext(spr_star_filled, image_speed, xx, yy, starScale, starScale, 0, c_white, 1);
}
else
{
	draw_sprite_ext(spr_star_empty, image_speed, xx, yy, starScale, starScale, 0, c_white, 1);
}

if star3
{
	draw_sprite_ext(spr_star_filled, image_speed, xx + sprite_get_width(spr_star_filled) * starScale, yy, starScale, starScale, 0, c_white, 1);
}
else
{
	draw_sprite_ext(spr_star_empty, image_speed, xx + sprite_get_width(spr_star_empty) * starScale, yy, starScale, starScale, 0, c_white, 1);
}

// Draw Key
if key
{
	draw_sprite_ext(spr_key_filled, image_speed, xx - _width + sprite_get_width(spr_key_filled) * starScale, yy + 148, starScale, starScale, 0, c_white, 1);
}
else
{
	draw_sprite_ext(spr_key_empty, image_speed, xx - _width + sprite_get_width(spr_key_empty) * starScale, yy  + 148, starScale, starScale, 0, c_white, 1);
}

// Draw Bonus Objective
draw_set_font(fnt_dialogue);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
//draw_set_color(c_black);
//draw_text(xx + sprite_get_width(spr_key_filled) * starScale, yy + 148 + offset, node.criteriaString);
draw_set_color(c_black);
draw_text(xx - 128, yy + 148, node.criteriaString);


// Draw Buttons
draw_sprite_ext(spr_button_okay, keyboard_check(ord("Z")), xx - 2*sprite_get_width(spr_button_okay), yy + 70, starScale, starScale, 0, c_white, 1);
draw_sprite_ext(spr_button_cancel, keyboard_check(ord("X")), xx + 2*sprite_get_width(spr_button_cancel), yy + 70, starScale, starScale, 0, c_white, 1);
