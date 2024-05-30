audio_stop_sound(mus_results);
audio_stop_sound(mus_worldmap);
audio_stop_sound(mus_sunsetstreet);
audio_play_sound(mus_worldmap, 0, true, global.gain_bgm);

global.can_pause = true;

ini_open(global.active_savefile);

if (ini_read_real("Totals", "Keys", 0) == 1 && !ini_read_real("Viewed Scenes", object_get_name(scene_keytut), 0))
{
	ini_write_real("Viewed Scenes", object_get_name(scene_keytut), 1);
	instance_create_layer(0, 0, "Instances", scene_keytut);
}

ini_close();

with (obj_discord)
{
	np_setpresence("Sunset Street", "World Map", "world_map_1", "")
}