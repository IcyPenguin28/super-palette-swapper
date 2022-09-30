/// @description Insert description here
// You can write your code in this editor
if (state = state_breezepuff.idle)
{
	state = state_breezepuff.attack;
	dir *= -1;
}
else
{
	state = state_breezepuff.idle;
}