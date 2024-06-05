// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_type(x, y, text, progress, width){
	var drawX = 0;
	var drawY = 0;
	
	var offset = 2;
	
	for (var i = 1; i <= progress; i++)
	{
		var char = string_char_at(text, i);
		
		// Handle normal line breaks
		if char == "\n"
		{
			drawX = 0;
			drawY += string_height("A");
		}
		// If we're starting a new word, we can line break
		else if char == " "
		{
			drawX += string_width(char);
			var wordWidth = 0;
			for (var j = i + 1; j <= string_length(text); j++)
			{
				var wordChar = string_char_at(text, j);
				
				if wordChar == " " || wordChar == "\n"
				{
					break;
				}
				
				// If current word exceeds past width boundary, move it to next line
				wordWidth += string_width(wordChar);
				if (drawX + wordWidth > width)
				{
					drawX = 0;
					drawY += string_height("A");
					break;
				}
			}
		}
		else
		{
			// Draw the letter
			// Dropshadow: draw_text_color(x + drawX, y + drawY + offset, char, c_gray, c_gray, c_gray, c_gray, 1);
			draw_text_color(x + drawX, y + drawY, char, c_black, c_black, c_black, c_black, 1);
			drawX += string_width(char);
		}
	}
	
}