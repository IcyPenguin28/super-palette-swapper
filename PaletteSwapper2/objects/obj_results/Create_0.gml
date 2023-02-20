/// @description Insert description here
// You can write your code in this editor
a = 0;
aRate = 0.005;
slideAmt = 0.1;

baseScale = 3;
scale1 = baseScale;
scale2 = baseScale;
scale3 = baseScale;
scale4 = baseScale;

scaleRate = 0.075;
scaleFactor = 1.2;

starx1 = -200;
starx2 = -200;
starx3 = -200;
stary = display_get_gui_height() / 3;
keyY = display_get_gui_height() / 3 + 96;

padding = sprite_get_width(spr_star_empty) * scale1;
numFit = (640 / padding);

starsOnScreen = false;


ini_open(global.active_savefile);
star1Filled = ini_read_real(room_get_name(room), "star1", 0);
star2Filled = ini_read_real(room_get_name(room), "star2", 0);
star3Filled = ini_read_real(room_get_name(room), "star3", 0);
keyFilled = ini_read_real(room_get_name(room), "key", 0);
ini_close();

canContinue = false;

image_speed = 0.2;