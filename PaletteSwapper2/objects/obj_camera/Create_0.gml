/// @description Insert description here
// You can write your code in this editor

//Constants
wRes = 384;
hRes = 216;
resScale = 4;
panSpd = 0.1;

//Create camera
view_enabled = true;
view_visible[0] = true;

cam = camera_create_view(0,0,wRes,hRes,0,obj_player);
view_set_camera(0,cam);

window_set_size(wRes*resScale,hRes*resScale);
surface_resize(application_surface,wRes*resScale,hRes*resScale);
display_set_gui_size(wRes,hRes);