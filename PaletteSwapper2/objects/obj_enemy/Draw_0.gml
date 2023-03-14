/// @description Insert description here

var _x = x;
var _y = y;

var _xhitstop = 2 * (((hitstopstep div 2) % 2)? 1:-1) * sqrt(abs(hitstopstep));

draw_sprite_ext(
	sprite_index, 
	image_index,
	_x + _xhitstop,
	_y,
	image_xscale,
	image_yscale,
	image_angle,
	image_blend,
	image_alpha
	);

if (hpDisplayStep > 0)
{
	draw_healthbar(x - 8, y - (sprite_height/2 + 8), x + 8, y - (sprite_height/2 + 6), (hp / maxhp) * 100, c_black, c_red, c_lime, 0, true, false);
}
else
{
	
}