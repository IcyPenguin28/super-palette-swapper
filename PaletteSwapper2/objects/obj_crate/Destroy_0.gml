/// @description Insert description here
// You can write your code in this editor



// Inherit the parent event
event_inherited();

audio_play_sound(snd_crate_break, 0, false, global.gain_sfx);
var _ps = part_system_create(pt_crate_shrapnel);
part_system_position(_ps, x, y);