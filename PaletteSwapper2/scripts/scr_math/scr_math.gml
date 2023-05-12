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

// Returns 1 or -1 based on evaluated boolean
function polarize(x)
{
	return bool(x)? 1: -1;
}
