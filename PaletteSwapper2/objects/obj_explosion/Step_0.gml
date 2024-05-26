/// @description Insert description here
// You can write your code in this editor


// Deal damage to enemy
var e = instance_place(x, y, obj_enemy)
if (e)
{
	// THIS ORDER IS IMPORTANT!
	e.RehitAppend(self, 30);
	e.TakeKnockback(kbstrength, kbangle, self);
	e.TakeDamage(atk, self);
}