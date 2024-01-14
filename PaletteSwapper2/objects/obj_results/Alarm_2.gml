/// @description Insert description here
// You can write your code in this editor
if obj_stagecontroller.time <= obj_stagecontroller.threshold
{
	star3Filled = true;
	audio_play_sound(snd_star, 0, false, global.gain_sfx);
}