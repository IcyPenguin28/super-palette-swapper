/// @description Insert description here
// You can write your code in this editor

xx = display_get_gui_width() / 2;
yy = display_get_gui_height();
slideAmt = 0.1;
onScreen = true;

node = noone;
color = c_gray;

star1 = false;
star2 = false;
star3 = false;
key = false;

confirmDelay = 2;
levelConfirmed = false;

image_speed = 0.1;

function SetNode(_node)
{
	node = _node;
	color = node.previewCol;
}

depth = 2;