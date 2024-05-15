audio_stop_sound(mus_mainmenu);
audio_stop_sound(mus_sunsetstreet);
audio_stop_sound(mus_boss_rival);
audio_stop_sound(snd_victory);
audio_stop_sound(mus_results);
audio_play_sound(mus_sunsetstreet, 0, true, global.gain_bgm);

with (obj_discord)
{
	var smimgtxt = "playing_as_andy"	// "SMall IMaGe TeXT"
	// When Claudia is added, add conditional statements.
	// Note that instances get loaded after room creation code. Worry about this later. Fuck you, future Scott :)
	
	np_setpresence("Sunset Street-1", "Exploring", "sunset_street", smimgtxt);
}