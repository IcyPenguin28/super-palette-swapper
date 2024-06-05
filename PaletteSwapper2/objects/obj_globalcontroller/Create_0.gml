/// @description Insert description here
// You can write your code in this editor

global.options_file = "player_options.ini"

// Controls
global.gp_device = -1;
global.gp_desc = "";


global.key_left = "left";
global.key_right = "right";
global.key_up = "up";
global.key_down = "down";
global.key_confirm = "confirm";
global.key_cancel = "cancel";
global.key_jump = "jump";
global.key_brush = "brush";
global.key_action = "dash";
global.key_rotateL = "rotateL";
global.key_rotateR = "rotateR";
global.key_pause = "pause";
global.key_w = "white";
global.key_r = "red";
global.key_y = "yellow";
global.key_g = "green";
global.key_b = "blue";

ini_open(global.options_file);
// Audio Settings
global.gain_bgm = ini_read_real("Audio", "BGM Volume", 0.5);
global.gain_sfx = ini_read_real("Audio", "SFX Volume", 1);

// Variable Video Settings
global.video_scale = ini_read_real("Video", "Scale", 2);
window_set_fullscreen(ini_read_real("Video", "Fullscreen", 0));
ini_close();

// Constant Video Settings
global.h_res = 640;
global.v_res = 360;
display_set_gui_size(global.h_res, global.v_res);

// Save File
global.active_savefile = "save1.ini"

// Debug
#macro DEBUG global.g_debug
DEBUG = 0;	// Toggle with tilde "`" key

// Screencapping
ind = 0;

// Pausing
global.can_pause = false;
global.paused = false;

timestepLevel = 1;