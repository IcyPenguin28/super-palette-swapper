/// @description Insert description here
// You can write your code in this editor
global.gp_device = -1;
global.gp_desc = "";
global.h_res = 640;
global.v_res = 360;

global.active_savefile = "save1.ini"

display_set_gui_size(global.h_res, global.v_res);



// Debug
#macro DEBUG global.g_debug
DEBUG = 0;	// Toggle with tilde "`" key

timestepLevel = 1;

