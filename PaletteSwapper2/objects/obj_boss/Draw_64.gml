/// @description Insert description here
// You can write your code in this editor

// TODO: Replace with custom sprite eventually
var _length = 128;
var _width = 48;
var _padding = 16;

if displayHP
{
	draw_healthbar(
		display_get_gui_width()/2 - _length/2, 
		_padding, 
		display_get_gui_width()/2 + _length/2,
		_padding + _width, 
		(hp/maxHP) * 100, 
		c_black, 
		c_maroon, 
		c_red, 
		0, 
		true, 
		false
		);
	
	
}
