/// @description Insert description here
// You can write your code in this editor


// If scene is not important, it will be skipped upon future triggers
if (myScene != scene_preboss1 && myScene != scene_postboss1)
{
	ini_open(global.active_savefile);
	ini_write_real("Viewed Scenes", object_get_name(myScene), 1);
	ini_close();
}