/// @description Insert description here
// You can write your code in this editor
with (other)
{
	if (!inAttack && lastprojectile != other)
	{
		lastprojectile = other;
	
		hp -= (other.atk - def);

		hsp += ((other.image_xscale) * other.kbx) - kbres;
		vsp -= ((other.image_yscale) * other.kby) + kbres;
	
		hpDisplayStep = hpDisplayTime;
	
		knockbackSide = sign(other.kbx);
		knockbackDamp = 20;
	
		OnHit();
	
	}
}
instance_destroy();