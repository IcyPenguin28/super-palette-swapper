/// @description Insert description here
// You can write your code in this editor
var drops = obj_player.collectedBigDrops;

if drops[0] && drops[1] && drops[2]
{
	star2Filled = true;
	audio_play_sound(snd_star, 0, false);
}