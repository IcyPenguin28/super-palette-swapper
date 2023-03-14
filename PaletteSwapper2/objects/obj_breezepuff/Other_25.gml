/// @desc 

// Inherit the parent event
event_inherited();

function OnHit()
{
	hitstopstep = 7;
	SetState(ST_EN_BreezePuff.hurt);
}

