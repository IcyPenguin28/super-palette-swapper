/// @description Insert description here
// You can write your code in this editor

xx = display_get_gui_width() / 2;
yy = display_get_gui_height();
slideAmt = 0.1;
onScreen = true;

node = instance_nearest(obj_player_worldmap.x, obj_player_worldmap.y, obj_worldmapnode);
color = node.previewCol;

star1 = false;
star2 = false;
star3 = false;
key = false;

image_speed = 0.1;