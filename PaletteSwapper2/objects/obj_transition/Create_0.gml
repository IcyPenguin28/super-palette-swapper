/// @description Insert description here
// You can write your code in this editor

width = global.h_res;
height = global.v_res;
shrinking = true;
rad = max(width, height);
spd = 8;

target_room = room;
depth = -10000;
transition_surface = -1;

show_debug_message("New Transition Inst: id = " + string(id));
