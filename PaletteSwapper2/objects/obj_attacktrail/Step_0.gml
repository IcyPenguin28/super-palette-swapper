/// @desc 

x += image_xscale * spd;

life -= 1;

if (life <= 0)
{
	instance_destroy();
	return;
}

image_index = lerp(image_number, 0, 1-power(1-life/lifemax, 0.7));

// Deal damage to enemy
var e = instance_place(x, y, obj_enemy)
if (e)
{
	// THIS ORDER IS IMPORTANT!
	e.RehitAppend(self, 30);
	e.TakeKnockback(kbstrength, kbangle, self);
	e.TakeDamage(atk, self);
}

