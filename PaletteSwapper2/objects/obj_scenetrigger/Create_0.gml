/// @description Insert description here
// You can write your code in this editor

// Change in variable definitions in room editor
myScene = myScene;	// The scene to play on trigger

viewed = false;

// Destroy if viewed already
ini_open(global.active_savefile);

if (ini_read_real("Viewed Scenes", object_get_name(myScene), 0))
{
	viewed = true;
}
ini_close();

if viewed
{
	instance_destroy();
}