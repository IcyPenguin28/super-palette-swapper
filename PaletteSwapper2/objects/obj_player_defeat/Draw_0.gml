/// @desc 

draw_sprite_ext(spr_pixel, 0, 0, 0, room_width, room_height, 0, 0, image_alpha);

pal_swap_set(spr_andy_palette, obj_palette.activeSlot, false);
spriteanimator.DrawLayers(x, y, c_white, 1, image_xscale, 1, image_angle);
shader_reset();

draw_set_halign(1);
draw_set_valign(1);
draw_text_color(obj_camera.xcenter, texty+obj_camera.ycenter, "TRY AGAIN",
	c_white, c_white, c_white, c_white, textalpha);
