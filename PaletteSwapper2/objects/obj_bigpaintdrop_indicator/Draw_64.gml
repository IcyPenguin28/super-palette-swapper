/// @description Insert description here
// You can write your code in this editor
var p = obj_player;

if instance_exists(p)
{
	var drops = p.collectedBigDrops;
}
else
{
	// TODO: Find a way to set it so that the indicator does not change images on player death
	var drops = [false, false, false];
}

if onScreen
{
	x = lerp(x, 0, slideSpd);
}
else
{
	x = lerp(x, -192, slideSpd);
}

// Draw paint bk. 9 slice allows drawing of any width
draw_sprite_stretched(spr_ui_bigpaint_bk, 0, x, y, 144, sprite_get_height(spr_ui_bigpaint_bk));

// Draw drops
pal_swap_set(spr_andy_palette, obj_palette.activeSlot, false);
for (var i = 0; i < dropcount; i++)
{
	draw_sprite(spr_ui_bigpaint_drop, drops[i], 
		x + dropdrawX + dropdrawSep * i,
		y + dropdrawY
		);
}
shader_reset();

/*
var subimg = 0;

if !drops[0] && !drops[1] && !drops[2]
{
	subimg = 0;
}
else if drops[0] && !drops[1] && !drops[2]
{
	subimg = 1;
}
else if !drops[0] && drops[1] && !drops[2]
{
	subimg = 2;
}
else if drops[0] && drops[1] && !drops[2]
{
	subimg = 3;
}
else if !drops[0] && !drops[1] && drops[2]
{
	subimg = 4;
}
else if drops[0] && !drops[1] && drops[2]
{
	subimg = 5;
}
else if !drops[0] && drops[1] && drops[2]
{
	subimg = 6;
}
else if drops[0] && drops[1] && drops[2]
{
	subimg = 7;
}

draw_sprite(spr_bigpaintdrop_indicator, subimg, xx, yy);
*/