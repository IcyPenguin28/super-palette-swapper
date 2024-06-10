/// @description Insert description here
// You can write your code in this editor

// Create surface if not found (May be deleted via passive graphics management)
if (!surface_exists(transition_surface)) {
	transition_surface = surface_create(width, height);
}

if surface_exists(transition_surface)
{
	shader_reset();	// Prevents "Draw failed" error. Necessary for primitive drawing (draw_line, draw_rectangle, etc.)
	
	surface_set_target(transition_surface);
	draw_set_color(c_white);
	draw_clear(c_black);
	draw_set_circle_precision(64);
	
	// Set blend mode
	gpu_set_blendmode(bm_subtract);
	
	// Draw circle
	draw_circle(width / 2, height / 2, rad, false);
	
	// Reset
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
	draw_surface(transition_surface, 0, 0);
}