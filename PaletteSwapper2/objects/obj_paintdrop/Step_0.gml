/// @Enable Palette Swapping
// You can write your code in this editor
event_inherited();

if instance_exists(obj_player)
{
	pal_swap_set(spr_andy_palette, obj_player.myCol - 1, false);
}

draw_self();