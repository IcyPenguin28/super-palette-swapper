/// @description Insert description here
// You can write your code in this editor
var xx = display_get_gui_width() / 2;
var yy = 64;
var offset = 4;

draw_set_alpha(1);
draw_set_font(fnt_goal);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if stageCleared
{
	// Display stage clear text
	draw_text_color(xx, yy + offset, "PAINT GET!", c_black, c_black, c_black, c_black, 1);
	draw_text_color(xx, yy, "PAINT GET!", c_red, c_yellow, c_green, c_aqua, 1);
	
	draw_set_font(fnt_levelpreview);
	draw_text_color(xx, yy *4.5, "You can now DASH!", c_black, c_black, c_black, c_black, 1);
	// Hide Rest of GUI
	with obj_ui
	{
		HideUI();
	}
}