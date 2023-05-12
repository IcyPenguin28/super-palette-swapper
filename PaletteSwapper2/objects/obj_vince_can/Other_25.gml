/// @desc 

// Inherit the parent event
event_inherited();

function Update(ts)
{
	x += hsp;
	y += vsp;
	
	vsp += grav;
	
	var cflags = 0;
	
	if (grav == 0)
	{
		cflags = ProcessCollision(false);
		
		if (cflags & FL_COLLISION_L) {hsp = abs(hsp);}
		if (cflags & FL_COLLISION_R) {hsp = -abs(hsp);}
		if (cflags & FL_COLLISION_U) {vsp = abs(vsp);}
		if (cflags & FL_COLLISION_D) {vsp = -abs(vsp);}
	}
	
	if (lifestep < life)
	{
		lifestep += ts;
		
		if (trailstep > 0) {trailstep -= ts;}
		else
		{
			instance_create_depth(x, y, depth + 10, obj_vince_can_trail);
			trailstep = 1;
		}
	}
	else
	{
		atk = 0;
		if ( cflags != 0 )
		{
			grav = 0.15;
			vsp *= 0.5;
		}
		
		if (y > room_height)
		{
			instance_destroy();
			return;
		}
	}
	
	image_xscale = polarize(hsp);
}

