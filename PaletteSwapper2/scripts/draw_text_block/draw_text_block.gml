/*
*/

/// @arg x,y,scale,str,str,...
function draw_text_block()
{
	var n = argument_count;
	var xx = argument[0];
	var yy = argument[1];
	var size = argument[2];
	var hh = string_height("jM");
	
	if (draw_get_valign() == fa_bottom)
	{
		for (var i = n-1; i >= 3; i--)
		{
			draw_text_transformed(xx, yy, argument[i], size, size, 0);
			yy -= hh * size;
		}
	}
	else
	{
		for (var i = n-1; i >= 3; i--)
		{
			draw_text_transformed(xx, yy, argument[i], size, size, 0);
			yy += hh * size;
		}
	}
}
