/// @description Draw menu
// You can write your code in this editor

// Draw menu cursor
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_sprite(self.sprite_index, 0, x, optionsY[pos])

// Draw text at each position
draw_set_font(fnt_dialogue);
draw_set_color(c_black);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

// Display arrows on highlighted option
switch pos
{
	case audiomenu.bgm:
		optionsText[audiomenu.bgm] = "BGM Volume: < "+string(bgm_vol * 100)+"% >";
		optionsText[audiomenu.sfx] = "SFX Volume:   "+string(sfx_vol * 100)+"%  ";
		break;
	case audiomenu.sfx:
		optionsText[audiomenu.bgm] = "BGM Volume:   "+string(bgm_vol * 100)+"%  ";
		optionsText[audiomenu.sfx] = "SFX Volume: < "+string(sfx_vol * 100)+"% >";
		break;
}


for (var i = 0; i < array_length(optionsText); i++)
{
	draw_text(x + hPadding, optionsY[i], optionsText[i]);
}