/// @description Insert description here
// You can write your code in this editor
draw_self();

if (hpDisplayStep > 0)
{
	draw_healthbar(x - 8, y - (sprite_height/2 + 8), x + 8, y - (sprite_height/2 + 6), (hp / maxhp) * 100, c_black, c_red, c_lime, 0, true, false);
}
else
{
	
}