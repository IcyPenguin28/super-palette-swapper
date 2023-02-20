/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);

draw_set_font(fnt_levelpreview);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if file_exists(myFile)
{
	//draw_set_color(c_black);
	//draw_text(x, y + 4, string(round(numCollected / numCollectibles)) + "%");
	draw_set_color(make_color_rgb(149, 157, 170));
	draw_text(x, y, string(round(numCollected / numCollectibles)) + "%");
}