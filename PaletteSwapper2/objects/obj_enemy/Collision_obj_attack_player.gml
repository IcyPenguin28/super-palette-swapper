/// @description Insert description here
// You can write your code in this editor
if (!inAttack)
{
hp -= (other.atk - def);

hsp += ((other.image_xscale) * other.kbx) - kbres;
vsp -= ((other.image_yscale) * other.kby) + kbres;

hpDisplayStep = hpDisplayTime;
}
