/// @desc 

if ( trigger_on_touch )
{
	// Player Exit
	if ( touch )
	{
		if (!instance_place(x, y, obj_player))
		{
			touch = false;
		}
	}
	// Player Enter
	else
	{
		if (instance_place(x, y, obj_player))
		{
			touch = true;
			obj_camera.SetBounds(
				clamp_left? bbox_left: 0, 
				clamp_top? bbox_top: 0, 
				clamp_right? bbox_right: room_width,
				clamp_bottom? bbox_bottom: room_height
				);
		}
	}
}

