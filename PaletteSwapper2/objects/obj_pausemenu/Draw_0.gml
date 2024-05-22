/// @description Draw menu
// You can write your code in this editor

// Draw screen grab and lighten
if surface_exists(pause_surface)
{
	draw_surface(pause_surface, 0, 0);
	draw_set_color(c_white);
	draw_set_alpha(0.5);
	draw_rectangle(0, 0, surface_get_width(pause_surface), surface_get_height(pause_surface), false);
	draw_set_alpha(1);
}

// Draw menu cursor
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_sprite(self.sprite_index, 0, x, optionsY[pos]);

// Draw text at each position
draw_set_font(fnt_dialogue);
draw_set_color(c_black);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

for (var i = 0; i < array_length(optionsText); i++)
{
	draw_text(x + hPadding, optionsY[i], optionsText[i]);
}