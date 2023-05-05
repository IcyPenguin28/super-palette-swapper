/// @desc 

// Release touch (Player Exit)
if ( touch )
{
	if (!instance_place(x, y, obj_player))
	{
		touch = false;
	}
}
// New touch (Player Enter)
else
{
	if (instance_place(x, y, obj_player))
	{
		touch = true;
		
		if ( instance_exists(target) )
		{
			if ( DEBUG > 0 )
			{
				show_debug_message("> Trigger Called");
			}
			target.OnTrigger(self);
		}
	}
}



