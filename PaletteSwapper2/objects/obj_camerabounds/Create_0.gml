/// @desc 

touch = false;
trigger_on_touch = trigger_on_touch;

/*
	Use variable definitions in Room Editor for clamp directions
*/

function OnTrigger(trigger)
{
	obj_camera.SetBounds(
		clamp_left? bbox_left: 0, 
		clamp_top? bbox_top: 0, 
		clamp_right? bbox_right: room_width,
		clamp_bottom? bbox_bottom: room_height
		);
}