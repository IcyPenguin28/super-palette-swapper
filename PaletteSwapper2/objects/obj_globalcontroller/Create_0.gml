/// @description Insert description here
// You can write your code in this editor

global.options_file = "player_options.ini"

// Controls
global.gp_device = -1;
global.gp_desc = "";

ini_open(global.options_file);
global.key_left = ini_read_real("Keyboard Controls", "left", vk_left);
global.key_right = ini_read_real("Keyboard Controls", "right", vk_right);
global.key_up = ini_read_real("Keyboard Controls", "up", vk_up);
global.key_down = ini_read_real("Keyboard Controls", "down", vk_down);
global.key_confirm = ini_read_real("Keyboard Controls", "confirm", ord("Z"));
global.key_cancel = ini_read_real("Keyboard Controls", "cancel", ord("X"));
global.key_jump = ini_read_real("Keyboard Controls", "jump", ord("Z"));
global.key_brush = ini_read_real("Keyboard Controls", "brush",ord("X"));
global.key_action = ini_read_real("Keyboard Controls", "action", ord("C"));
global.key_rotateL = ini_read_real("Keyboard Controls", "rotateL", ord("A"));
global.key_rotateR = ini_read_real("Keyboard Controls", "rotateR", ord("S"));
global.key_w = ini_read_real("Keyboard Controls", "white", ord("D"));
global.key_r = ini_read_real("Keyboard Controls", "red", ord("1"));
global.key_o = ini_read_real("Keyboard Controls", "orange", ord("2"));
global.key_y = ini_read_real("Keyboard Controls", "yellow", ord("3"));
global.key_c = ini_read_real("Keyboard Controls", "cyan", ord("4"));
global.key_g = ini_read_real("Keyboard Controls", "green", ord("5"));
global.key_b = ini_read_real("Keyboard Controls", "blue", ord("6"));
global.key_i = ini_read_real("Keyboard Controls", "indigo", ord("7"));
global.key_p = ini_read_real("Keyboard Controls", "purple", ord("8"));

global.gp_left = ini_read_real("Gamepad Controls", "left", gp_padl);
global.gp_right = ini_read_real("Gamepad Controls", "right", gp_padr);
global.gp_up = ini_read_real("Gamepad Controls", "up", gp_padu);
global.gp_down = ini_read_real("Gamepad Controls", "down", gp_padd);
global.gp_confirm = ini_read_real("Gamepad Controls", "confirm", gp_face1);
global.gp_cancel = ini_read_real("Gamepad Controls", "cancel", gp_face2);
global.gp_jump = ini_read_real("Gamepad Controls", "jump", gp_face1);
global.gp_brush = ini_read_real("Gamepad Controls", "brush", gp_face3);
global.gp_action = ini_read_real("Gamepad Controls", "action", gp_face2);
global.gp_rotateL = ini_read_real("Gamepad Controls", "rotateL", gp_shoulderl);
global.gp_rotateR = ini_read_real("Gamepad Controls", "rotateR", gp_shoulderr);

// Video Settings
global.h_res = 640;
global.v_res = 360;

// Save File
global.active_savefile = "save1.ini"

display_set_gui_size(global.h_res, global.v_res);



// Debug
#macro DEBUG global.g_debug
DEBUG = 0;	// Toggle with tilde "`" key

timestepLevel = 1;