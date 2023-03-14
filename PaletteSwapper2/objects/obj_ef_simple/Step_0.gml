/// @desc 

if (life != -1 && lifemax == -1) {lifemax = life;}

var ts = 1;

life = approach_value(life, 0, ts);

if (life <= 0)
{
	instance_destroy();
	return;
}
else
{
	image_index = image_number * (power(1-life/lifemax, lifedegree));
}
