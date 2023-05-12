/// @desc 

var ts = 1;

switch(state)
{
	// Pause
	case(0):
		obj_globalcontroller.timestepLevel = 0;
		
		if (statestep < 40) {statestep += ts;}
		else
		{
			statestep = 30;
			state = 1;
			vsp = -6;
		}
		break;
	
	// Fall
	case(1):
		y += vsp;
		vsp += grav;
		image_angle += 10;
		
		if (statestep > 0) 
		{
			statestep -= ts;
			texty = lerp(-400, 0, sqr(1-statestep/30));
			image_alpha = 1-statestep/30;
		}
		else
		{
			statestep = 30;
			state = 2;
		}
		break;
	
	// Shake
	case(2):
		y += vsp;
		vsp += grav;
		image_angle += 10;
		
		if (statestep > 0) 
		{
			statestep -= ts;
			texty = polarize(BoolStep(statestep, 2)) * sqrt(statestep);
		}
		else
		{
			statestep = 50;
			state = 3;
		}
		
		break;
	
	// Wait
	case(3):
		y += vsp;
		vsp += grav;
		image_angle += 10;
		
		if (statestep > 0) {statestep -= ts;}
		else
		{
			statestep = 30;
			state = 4;
		}
		break;
	
	// Fadeout
	case(4):
		y += vsp;
		vsp += grav;
		image_angle += 10;
		
		if (statestep > 0) 
		{
			statestep -= ts;
			textalpha = statestep/30;
		}
		else
		{
			state++;
			statestep = 20;
		}
		
		
		break;
	
	// Wait for restart
	case(5):
		if (statestep > 0) {statestep -= ts;}
		else
		{
			room_restart();
		}
		break;
}
