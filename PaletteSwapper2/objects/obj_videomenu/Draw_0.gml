/// @description Draw menu
// You can write your code in this editor

// Draw menu cursor
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_sprite(self.sprite_index, 0, x, optionsY[pos])

// Draw text at each position
draw_set_font(fnt_dialogue);
draw_set_color(c_black);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

if window_get_fullscreen()
{
	optionsText[videomenu.scale] = "Scale Factor: < Fullscreen >";
}
else
{
	optionsText[videomenu.scale] = "Scale Factor: < "+string(scale)+"x >";
}

draw_text(x + hPadding, optionsY[videomenu.scale], optionsText[videomenu.scale]);