/// @description Insert description here
// You can write your code in this editor

event_user(15);

enum ST_Camera
{
	zero,
	free,
	player,
	entity,
}

//Constants
wRes = 640;
hRes = 360;
resScale = 2;
panSpd = 0.1;

playerCam = camera_create_view(0,0,wRes,hRes,0,obj_player);
targetCam = camera_create_view(0,0,wRes,hRes,0,obj_camera_target);

locationtarget = [0,0];	// Final target position
locationintermediate = [0,0];	// Midway target position. 1 degree of smoothing
location = [0,0];	// Current position (x,y)

playerCamLookX = 64;	// X Offset in player direction
playerCamLookY = 64;	// Unused

state = ST_Camera.free;
cameratarget = noone;
onTarget = false;	// True when location matches target

//Create camera
view_enabled = true;
view_visible[0] = true;
cam = camera_create_view(0,0,wRes,hRes);

//if instance_exists(obj_player) {cam = playerCam;}
//else {cam = targetCam;}

view_set_camera(0,cam);

window_set_size(wRes*resScale,hRes*resScale);
surface_resize(application_surface,wRes*resScale,hRes*resScale);
display_set_gui_size(wRes,hRes);

