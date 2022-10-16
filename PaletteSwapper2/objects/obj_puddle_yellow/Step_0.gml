/// @description Insert description here
// You can write your code in this editor
// Destroy themselves if they fall off-cam
var c = obj_camera;
if (instance_exists(c))
{
	
	if (x < c.camX || x > c.camX + c.camW || y < c.camY || y > c.camY + c.camH)
	{
		instance_destroy();
	}
}