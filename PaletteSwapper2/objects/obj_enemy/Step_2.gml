/// @description Insert description here
// You can write your code in this editor

// Do not question why this is in end step and not step. for some reason, step does not run, but this will.
// I will question this - Isaiah

if (hpDisplayStep > 0)
{
	hpDisplayStep --;
}

if !(place_meeting(x, y, obj_attack_player))
{
	inAttack = false;
}
else
{
	inAttack = true;
}