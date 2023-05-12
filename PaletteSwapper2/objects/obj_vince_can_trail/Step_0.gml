/// @desc 

lifestep += 1;
if (lifestep >= life)
{
	instance_destroy();
	return;
}

image_xscale = (1-(lifestep / life)) * 0.5;
image_yscale = image_xscale;

