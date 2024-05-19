/// @description Insert description here
// You can write your code in this editor

if !file_exists(myFile)
{
	image_index = 0;
}
else
{
	if !alteredImage
	{
		ini_open(myFile);
		 image_index += ini_read_real("rm_introstage", "cleared", 0);
		// image_index += ini_read_real("rm_sunsetstreet_boss", "cleared", 0);
		// image_index += ini_read_real("rm_autumntrails_boss", "cleared", 0);
		// image_index += ini_read_real("rm_cobaltbayharbor_boss", "cleared", 0);
		// image_index += ini_read_real("rm_overgrowntowers_boss", "cleared", 0);
		// image_index += ini_read_real("rm_midnightmountains_boss", "cleared", 0);
		// image_index += ini_read_real("rm_snowcapsquare_boss", "cleared", 0);
		// image_index += ini_read_real("rm_galevalleyfarms_boss", "cleared", 0);
		ini_close();	
		alteredImage = true;
	}
}

if chosen
{
	audio_stop_sound(mus_mainmenu);
	if !file_exists(myFile)
	{
		global.active_savefile = myFile;
		// room_goto(rm_introstage);
		obj_savemenu.canInteract = false;
		with (instance_create_layer(0, 0, "Instances", obj_transition))
		{
			target_room = rm_introstage;
		}
	}
	else
	{
		if obj_mainmenu.menuPos == mainmenu.newgame
		{
			file_delete(myFile);
			global.active_savefile = myFile;
			// room_goto(rm_introstage);
			obj_savemenu.canInteract = false;
			with (instance_create_layer(0, 0, "Instances", obj_transition))
			{
				target_room = rm_introstage;
			}
		}
		else
		{
			global.active_savefile = myFile;
			// room_goto(rm_worldmap);
			obj_savemenu.canInteract = false;
			with (instance_create_layer(0, 0, "Instances", obj_transition))
			{
				target_room = rm_worldmap;
			}
		}
	}
}