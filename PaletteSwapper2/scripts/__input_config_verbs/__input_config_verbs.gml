// Feather disable all

//This script contains the default profiles, and hence the default bindings and verbs, for your game
//
//  Please edit this macro to meet the needs of your game!
//
//The struct return by this script contains the names of each default profile.
//Default profiles then contain the names of verbs. Each verb should be given a binding that is
//appropriate for the profile. You can create bindings by calling one of the input_binding_*()
//functions, such as input_binding_key() for keyboard keys and input_binding_mouse() for
//mouse buttons

function __input_config_verbs()
{
    return {
        keyboard_and_mouse:
        {
			// Directions
            up:    input_binding_key(vk_up),
            down:  input_binding_key(vk_down),
            left:  input_binding_key(vk_left),
            right: input_binding_key(vk_right),
			
			// Player controls
			jump:	input_binding_key("Z"),
			brush:	input_binding_key("X"),
			weapon:	input_binding_key(vk_shift),
			dash:	input_binding_key("C"),
			eye:	input_binding_key(vk_control),
			
			// Palette controls
			rotateL:	input_binding_key("Q"),
			rotateR:	input_binding_key("E"),
			white:		input_binding_key("F"),
			red:		input_binding_key("W"),
			yellow:		input_binding_key("D"),
			green:		input_binding_key("S"),
			blue:		input_binding_key("A"),
			
            // Menu controls
            confirm:	input_binding_key("Z"),
            cancel:		input_binding_key("X"),
            pause:		input_binding_key(vk_escape),
        },
        
        gamepad:
        {
            // Directions
            up:    input_binding_gamepad_axis(gp_axislv, true),
            down:  input_binding_gamepad_axis(gp_axislv, false),
            left:  input_binding_gamepad_axis(gp_axislh, true),
            right: input_binding_gamepad_axis(gp_axislh, false),
			
			// Player controls
			jump:	input_binding_gamepad_button(gp_face1),
			brush:	input_binding_gamepad_button(gp_face3),
			weapon:	input_binding_gamepad_button(gp_face4),
			dash:	input_binding_gamepad_button(gp_face2),
			eye:	input_binding_gamepad_button(gp_shoulderrb),
			
			// Palette controls
			rotateL:	input_binding_gamepad_button(gp_shoulderl),
			rotateR:	input_binding_gamepad_button(gp_shoulderr),
			white:		input_binding_gamepad_button(gp_stickr),
			red:		input_binding_gamepad_axis(gp_axisrv, true),
			yellow:		input_binding_gamepad_axis(gp_axisrh, false),
			green:		input_binding_gamepad_axis(gp_axisrv, false),
			blue:		input_binding_gamepad_axis(gp_axisrh, true),
			
            // Menu controls
            confirm:	input_binding_gamepad_button(gp_face1),
            cancel:		input_binding_gamepad_button(gp_face2),
            pause:		input_binding_gamepad_button(gp_start),
        },
    };
}