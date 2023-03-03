/*
*/

function approach_value(x, target, step)
{
	return x < target? min(x + step, target): max(x - step, target);
}

function approach_smooth(x, target, smooth)
{
	return x < target? 
		min(x+(target-x+smooth)*smooth, target): 
		max(x+(target-x-smooth)*smooth, target);
}
