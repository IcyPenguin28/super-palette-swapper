/// @Enable Palette Swapping
// You can write your code in this editor

spriteanimator.DrawLayers(x, y, c_white, image_alpha, image_xscale, image_yscale, 0);
//draw_self();
pal_swap_set(spr_andy_palette,myCol - 1,false);

// Collision Debugging
if (debug)
{
	draw_line_color(x, y-8, bbox_left, y-8, c_orange, c_orange);
	draw_line_color(x, y-8, bbox_right, y-8, c_orange, c_orange);
	
	draw_line_color(x, y+8, bbox_left, y+8, c_orange, c_orange);
	draw_line_color(x, y+8, bbox_right, y+8, c_orange, c_orange);
	
	draw_line_color(x, y, x, bbox_top, c_olive, c_olive);
	draw_line_color(x, y, x, bbox_bottom, c_olive, c_olive);
	
	
}
