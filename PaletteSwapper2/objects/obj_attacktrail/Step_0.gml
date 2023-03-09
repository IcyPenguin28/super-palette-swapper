/// @desc 

x += image_xscale * spd;

life -= 1;

if (life <= 0)
{
	instance_destroy();
	return;
}

image_index = lerp(image_number, 0, 1-power(1-life/lifemax, 0.7));


