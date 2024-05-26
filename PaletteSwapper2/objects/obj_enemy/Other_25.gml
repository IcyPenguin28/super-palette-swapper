/// @description Insert description here
// You can write your code in this editor



// Inherit the parent event
event_inherited();

function OnDamage()
{
	flashTime = 10;
	audio_play_sound(snd_hit, 0, false, global.gain_sfx);
}