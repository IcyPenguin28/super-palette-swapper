audio_stop_sound(mus_results);
audio_stop_sound(mus_worldmap);
audio_play_sound(mus_worldmap, 0, true);

ini_open(global.active_savefile);

if (ini_read_real(room_get_name(rm_introstage), "key", 0))
{
	instance_create_layer(0, 0, "Instances", scene_keytut);
}