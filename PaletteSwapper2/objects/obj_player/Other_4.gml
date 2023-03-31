/// @desc 

if ( !instance_exists(obj_camera) )
{
	instance_create_depth(0, 0, 0, obj_camera);
}

obj_camera.SetLocation(x, y);
obj_camera.FollowPlayer();
obj_camera.SnapToTarget();
