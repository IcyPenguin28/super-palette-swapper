/// @description Insert description here
// You can write your code in this editor
if (other.object_index != obj_player)
{
	if (sign(other.grav) == 1 && sign(image_yscale) == 1)
	{
		other.grav = -other.grav;
		other.y -= 1;
	}
	else if (sign(other.grav) == -1 && sign(image_yscale == -1))
	{
		other.grav = abs(other.grav);
		other.y += 1;
	}
}