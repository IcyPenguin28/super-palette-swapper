/// @description Insert description here
// You can write your code in this editor

if onScreen
{
	x = lerp(x, 111, slideSpd);
}
else
{
	x = lerp(x, -192, slideSpd);
}

// Draw BG
draw_set_font(fnt_dropcount);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
var _padding = 4;
var w = 2*_padding + sprite_get_width(spr_paintdrop) + 16 + string_width("000");
var h = 24;
draw_sprite_stretched(spr_paintdrop_indicator, image_speed, x - w/2, y, w, h);

// Draw Drop
pal_swap_set(spr_andy_palette, obj_palette.activeSlot, false);
draw_sprite(spr_paintdrop, image_speed, x - w/2 + _padding * 2, y + h/2);
shader_reset();

// Draw Count Text
draw_set_color(c_black);
draw_set_halign(fa_center);
draw_text(x, y + h/2, string(count));