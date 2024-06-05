// Feather disable all

/// This script contains mappings from binding labels - a combination of keyboard key names, mouse button
/// names, and abstract gamepad names - to more friendly terms that you can show a player. Typically you'd
/// set up this function to return sprites such that you can draw gamepad icons as visual icons.
/// 
/// Default values in this script reflect the particular, and sometimes unexpected, buttons that each gamepad
/// binding maps to on the actual physical hardware. There are a handful of special cases at the top of the
/// script that are used to handle errors or misconfigurations.



//Special case: When a non-binding value is being evaluated
//              This should only happen if Input is given an invalid input argument
input_icon_not_a_binding("Not a binding");

//Special case: When an empty binding is being evaluated
input_icon_empty("Empty");

//Special case: When a touch binding (virtual button) is being evaluated
input_icon_touch("Virtual button");



//Optional remapping for keyboard and mouse
//This is useful for turning keyboard keys into sprite icons to match other assets, or for returning formatted strings (e.g. for use with Scribble)
//Any keyboard key label not in this struct will simply fall through and return the key name
input_icons_keyboard_and_mouse()
.add("A",				spr_prompt_kb_a)
.add("B",				spr_prompt_kb_b)
.add("C",				spr_prompt_kb_c)
.add("D",				spr_prompt_kb_d)
.add("E",				spr_prompt_kb_e)
.add("F",				spr_prompt_kb_f)
.add("G",				spr_prompt_kb_g)
.add("H",				spr_prompt_kb_h)
.add("I",				spr_prompt_kb_i)
.add("J",				spr_prompt_kb_j)
.add("K",				spr_prompt_kb_k)
.add("L",				spr_prompt_kb_l)
.add("M",				spr_prompt_kb_m)
.add("N",				spr_prompt_kb_n)
.add("O",				spr_prompt_kb_o)
.add("P",				spr_prompt_kb_p)
.add("Q",				spr_prompt_kb_q)
.add("R",				spr_prompt_kb_r)
.add("S",				spr_prompt_kb_s)
.add("T",				spr_prompt_kb_t)
.add("U",				spr_prompt_kb_u)
.add("V",				spr_prompt_kb_v)
.add("W",				spr_prompt_kb_w)
.add("X",				spr_prompt_kb_x)
.add("Y",				spr_prompt_kb_y)
.add("Z",				spr_prompt_kb_z)
.add("1",				spr_prompt_kb_1)
.add("2",				spr_prompt_kb_2)
.add("3",				spr_prompt_kb_3)
.add("4",				spr_prompt_kb_4)
.add("5",				spr_prompt_kb_5)
.add("6",				spr_prompt_kb_6)
.add("7",				spr_prompt_kb_7)
.add("8",				spr_prompt_kb_8)
.add("9",				spr_prompt_kb_9)
.add("0",				spr_prompt_kb_0)
.add("f1",				spr_prompt_kb_f1)
.add("f2",				spr_prompt_kb_f2)
.add("f3",				spr_prompt_kb_f3)
.add("f4",				spr_prompt_kb_f4)
.add("f5",				spr_prompt_kb_f5)
.add("f6",				spr_prompt_kb_f6)
.add("f7",				spr_prompt_kb_f7)
.add("f8",				spr_prompt_kb_f8)
.add("f9",				spr_prompt_kb_f9)
.add("f10",				spr_prompt_kb_f10)
.add("f11",				spr_prompt_kb_f11)
.add("f12",				spr_prompt_kb_f12)
.add("-",				spr_prompt_kb_minus)
.add("=",				spr_prompt_kb_equals)
.add("[",				spr_prompt_kb_lbracket)
.add("]",				spr_prompt_kb_rbracket)
//.add("\\",				spr_prompt_kb_backslash)
.add(";",				spr_prompt_kb_semicolon)
//.add("'",				spr_prompt_kb_apostrophe)
.add(",",				spr_prompt_kb_comma)
.add(".",				spr_prompt_kb_period)
.add("/",				spr_prompt_kb_slash)
.add("`",				spr_prompt_kb_tilde)
.add("arrow up",		spr_prompt_kb_up)
.add("arrow down",		spr_prompt_kb_down)
.add("arrow right",		spr_prompt_kb_right)
.add("arrow left",		spr_prompt_kb_left)
.add("escape",			spr_prompt_kb_escape)
.add("backspace",		spr_prompt_kb_backspace)
.add("enter",			spr_prompt_kb_enter)
.add("delete",			spr_prompt_kb_delete)
.add("home",			spr_prompt_kb_home)
.add("end",				spr_prompt_kb_end)
.add("space",			spr_prompt_kb_space)
.add("tab",				spr_prompt_kb_tab)
.add("insert",			spr_prompt_kb_insert)
.add("print screen",	spr_prompt_kb_print)
.add("page down",		spr_prompt_kb_pagedown)
.add("page up",			spr_prompt_kb_pageup)
.add("shift",			spr_prompt_kb_shift)
.add("pause break",		spr_prompt_kb_pause)
.add("ctrl",			spr_prompt_kb_control)
.add("caps lock",		spr_prompt_kb_capslock)

//Put extra .add() commands here to add icons to keyboard and mouse



#region Gamepads

//Xbox One and Series S|X controllers
input_icons_gamepad(INPUT_GAMEPAD_TYPE_XBOX_ONE)
.add("gamepad face south",         "A")
.add("gamepad face east",          "B")
.add("gamepad face west",          "X")
.add("gamepad face north",         "Y")
.add("gamepad shoulder l",         "LB")
.add("gamepad shoulder r",         "RB")
.add("gamepad trigger l",          "LT")
.add("gamepad trigger r",          "RT")
.add("gamepad select",             "view")
.add("gamepad start",              "menu")
.add("gamepad dpad left",          "dpad left")
.add("gamepad dpad right",         "dpad right")
.add("gamepad dpad up",            "dpad up")
.add("gamepad dpad down",          "dpad down")

.add("gamepad thumbstick l left",  "thumbstick l left")
.add("gamepad thumbstick l right", "thumbstick l right")
.add("gamepad thumbstick l up",    "thumbstick l up")
.add("gamepad thumbstick l down",  "thumbstick l down")
.add("gamepad thumbstick l click", "thumbstick l click")

.add("gamepad thumbstick r left",  "thumbstick r left")
.add("gamepad thumbstick r right", "thumbstick r right")
.add("gamepad thumbstick r up",    "thumbstick r up")
.add("gamepad thumbstick r down",  "thumbstick r down")
.add("gamepad thumbstick r click", "thumbstick r click")

//Series S|X only
.add("gamepad misc 1",             "share")

//Elite and third party controllers
.add("gamepad paddle 1",           "P1")
.add("gamepad paddle 2",           "P2")
.add("gamepad paddle 3",           "P3")
.add("gamepad paddle 4",           "P4")

//PlayStation 5
input_icons_gamepad(INPUT_GAMEPAD_TYPE_PS5)
.add("gamepad face south",         "cross")
.add("gamepad face east",          "circle")
.add("gamepad face west",          "square")
.add("gamepad face north",         "triangle")
.add("gamepad shoulder l",         "L1")
.add("gamepad shoulder r",         "R1")
.add("gamepad trigger l",          "L2")
.add("gamepad trigger r",          "R2")
.add("gamepad select",             "create")
.add("gamepad start",              "options")
.add("gamepad dpad left",          "dpad left")
.add("gamepad dpad right",         "dpad right")
.add("gamepad dpad up",            "dpad up")
.add("gamepad dpad down",          "dpad down")

.add("gamepad thumbstick l left",  "thumbstick l left")
.add("gamepad thumbstick l right", "thumbstick l right")
.add("gamepad thumbstick l up",    "thumbstick l up")
.add("gamepad thumbstick l down",  "thumbstick l down")
.add("gamepad thumbstick l click", "L3")

.add("gamepad thumbstick r left",  "thumbstick r left")
.add("gamepad thumbstick r right", "thumbstick r right")
.add("gamepad thumbstick r up",    "thumbstick r up")
.add("gamepad thumbstick r down",  "thumbstick r down")
.add("gamepad thumbstick r click", "R3")

.add("gamepad touchpad click",     "touchpad click")

//Not available on the PlayStation 5 console itself but available on other platforms
.add("gamepad misc 1",             "mic")

//DualSense Edge
.add("gamepad paddle 1",           "RB")
.add("gamepad paddle 2",           "LB")

//Switch handheld/dual JoyCon/Pro Controller
input_icons_gamepad(INPUT_GAMEPAD_TYPE_SWITCH)
.add("gamepad face south",         spr_prompt_switch_b)
.add("gamepad face east",          spr_prompt_switch_a)
.add("gamepad face west",          spr_prompt_switch_y)
.add("gamepad face north",         spr_prompt_switch_x)
.add("gamepad shoulder l",         spr_prompt_switch_l)
.add("gamepad shoulder r",         spr_prompt_switch_r)
.add("gamepad trigger l",          spr_prompt_switch_zl)
.add("gamepad trigger r",          spr_prompt_switch_zr)
.add("gamepad select",             spr_prompt_switch_minus)
.add("gamepad start",              spr_prompt_switch_plus)
.add("gamepad dpad left",          spr_prompt_switch_dpad_left)
.add("gamepad dpad right",         spr_prompt_switch_dpad_right)
.add("gamepad dpad up",            spr_prompt_switch_dpad_up)
.add("gamepad dpad down",          spr_prompt_switch_dpad_down)

.add("gamepad thumbstick l left",  spr_prompt_gamepad_lstick_left)
.add("gamepad thumbstick l right", spr_prompt_gamepad_lstick_right)
.add("gamepad thumbstick l up",    spr_prompt_gamepad_lstick_up)
.add("gamepad thumbstick l down",  spr_prompt_gamepad_lstick_down)
.add("gamepad thumbstick l click", spr_prompt_gamepad_lstick_click)
 
.add("gamepad thumbstick r left",  spr_prompt_gamepad_rstick_left)
.add("gamepad thumbstick r right", spr_prompt_gamepad_rstick_right)
.add("gamepad thumbstick r up",    spr_prompt_gamepad_rstick_up)
.add("gamepad thumbstick r down",  spr_prompt_gamepad_rstick_down)
.add("gamepad thumbstick r click", spr_prompt_gamepad_rstick_click)
  
//Not available on the Switch console itself but available on other platforms
.add("gamepad guide",              "home")
.add("gamepad misc 1",             "capture")

//Left-hand Switch JoyCon
//This setup assums horizontal hold type
input_icons_gamepad(INPUT_GAMEPAD_TYPE_JOYCON_LEFT)
.add("gamepad face south",         "face south")
.add("gamepad face east",          "face east")
.add("gamepad face west",          "face west") 
.add("gamepad face north",         "face north")
.add("gamepad shoulder l",         "SL")
.add("gamepad shoulder r",         "SR")
.add("gamepad start",              "minus")

.add("gamepad thumbstick l left",  "thumbstick left")
.add("gamepad thumbstick l right", "thumbstick right")
.add("gamepad thumbstick l up",    "thumbstick up")
.add("gamepad thumbstick l down",  "thumbstick down")
.add("gamepad thumbstick l click", "thumbstick click")

//Not available on the Switch console itself but available on other platforms
.add("gamepad select",             "capture")

//Right-hand Switch JoyCon
//This setup assums horizontal hold type
input_icons_gamepad(INPUT_GAMEPAD_TYPE_JOYCON_RIGHT)
.add("gamepad face south",         "face south")
.add("gamepad face east",          "face east")
.add("gamepad face west",          "face west") 
.add("gamepad face north",         "face north")
.add("gamepad shoulder l",         "SL")
.add("gamepad shoulder r",         "SR")
.add("gamepad start",              "plus")

.add("gamepad thumbstick l left",  "thumbstick left")
.add("gamepad thumbstick l right", "thumbstick right")
.add("gamepad thumbstick l up",    "thumbstick up")
.add("gamepad thumbstick l down",  "thumbstick down")
.add("gamepad thumbstick l click", "thumbstick click")

//Not available on the Switch console itself but available on other platforms
.add("gamepad select",             "home")

//Xbox 360
input_icons_gamepad(INPUT_GAMEPAD_TYPE_XBOX_360)
.add("gamepad face south",         "A")
.add("gamepad face east",          "B")
.add("gamepad face west",          "X")
.add("gamepad face north",         "Y")
.add("gamepad shoulder l",         "LB")
.add("gamepad shoulder r",         "RB")
.add("gamepad trigger l",          "LT")
.add("gamepad trigger r",          "RT")
.add("gamepad select",             "back")
.add("gamepad start",              "start")
.add("gamepad dpad left",          "dpad left")
.add("gamepad dpad right",         "dpad right")
.add("gamepad dpad up",            "dpad up")
.add("gamepad dpad down",          "dpad down")

.add("gamepad thumbstick l left",  "thumbstick l left")
.add("gamepad thumbstick l right", "thumbstick l right")
.add("gamepad thumbstick l up",    "thumbstick l up")
.add("gamepad thumbstick l down",  "thumbstick l down")
.add("gamepad thumbstick l click", "thumbstick l click")

.add("gamepad thumbstick r left",  "thumbstick r left")
.add("gamepad thumbstick r right", "thumbstick r right")
.add("gamepad thumbstick r up",    "thumbstick r up")
.add("gamepad thumbstick r down",  "thumbstick r down")
.add("gamepad thumbstick r click", "thumbstick r click")

//PlayStation 4
input_icons_gamepad(INPUT_GAMEPAD_TYPE_PS4)
.add("gamepad face south",         "cross")
.add("gamepad face east",          "circle")
.add("gamepad face west",          "square")
.add("gamepad face north",         "triangle")
.add("gamepad shoulder l",         "L1")
.add("gamepad shoulder r",         "R1")
.add("gamepad trigger l",          "L2")
.add("gamepad trigger r",          "R2")
.add("gamepad select",             "share")
.add("gamepad start",              "options")
.add("gamepad dpad left",          "dpad left")
.add("gamepad dpad right",         "dpad right")
.add("gamepad dpad up",            "dpad up")
.add("gamepad dpad down",          "dpad down")

.add("gamepad thumbstick l left",  "thumbstick l left")
.add("gamepad thumbstick l right", "thumbstick l right")
.add("gamepad thumbstick l up",    "thumbstick l up")
.add("gamepad thumbstick l down",  "thumbstick l down")
.add("gamepad thumbstick l click", "L3")

.add("gamepad thumbstick r left",  "thumbstick r left")
.add("gamepad thumbstick r right", "thumbstick r right")
.add("gamepad thumbstick r up",    "thumbstick r up")
.add("gamepad thumbstick r down",  "thumbstick r down")
.add("gamepad thumbstick r click", "R3")

.add("gamepad touchpad click",     "touchpad click")

//PlayStation 1-3
input_icons_gamepad(INPUT_GAMEPAD_TYPE_PSX)
.add("gamepad face south",         "cross")
.add("gamepad face east",          "circle")
.add("gamepad face west",          "square")
.add("gamepad face north",         "triangle")
.add("gamepad shoulder l",         "L1")
.add("gamepad shoulder r",         "R1")
.add("gamepad trigger l",          "L2")
.add("gamepad trigger r",          "R2")
.add("gamepad select",             "select")
.add("gamepad start",              "start")
.add("gamepad dpad left",          "dpad left")
.add("gamepad dpad right",         "dpad right")
.add("gamepad dpad up",            "dpad up")
.add("gamepad dpad down",          "dpad down")

.add("gamepad thumbstick l left",  "thumbstick l left")
.add("gamepad thumbstick l right", "thumbstick l right")
.add("gamepad thumbstick l up",    "thumbstick l up")
.add("gamepad thumbstick l down",  "thumbstick l down")
.add("gamepad thumbstick l click", "L3")

.add("gamepad thumbstick r left",  "thumbstick r left")
.add("gamepad thumbstick r right", "thumbstick r right")
.add("gamepad thumbstick r up",    "thumbstick r up")
.add("gamepad thumbstick r down",  "thumbstick r down")
.add("gamepad thumbstick r click", "R3")

//Nintendo Gamecube
input_icons_gamepad(INPUT_GAMEPAD_TYPE_GAMECUBE)
.add("gamepad face south",         "A")
.add("gamepad face east",          "X")
.add("gamepad face west",          "B")
.add("gamepad face north",         "Y")
.add("gamepad shoulder r",         "Z")
.add("gamepad trigger l",          "L")
.add("gamepad trigger r",          "R")
.add("gamepad start",              "start")
.add("gamepad dpad left",          "dpad left")
.add("gamepad dpad right",         "dpad right")
.add("gamepad dpad up",            "dpad up")
.add("gamepad dpad down",          "dpad down")

.add("gamepad thumbstick l left",  "thumbstick l left")
.add("gamepad thumbstick l right", "thumbstick l right")
.add("gamepad thumbstick l up",    "thumbstick l up")
.add("gamepad thumbstick l down",  "thumbstick l down")

.add("gamepad thumbstick r left",  "thumbstick r left")
.add("gamepad thumbstick r right", "thumbstick r right")
.add("gamepad thumbstick r up",    "thumbstick r up")
.add("gamepad thumbstick r down",  "thumbstick r down")

//The following icons are for Switch GameCube controllers and adapters only
.add("gamepad thumbstick l click", "thumbstick l click")
.add("gamepad thumbstick r click", "thumbstick r click")
.add("gamepad guide",              "home")
.add("gamepad misc 1",             "capture")

////A couple additional examples for optional gamepad types (see __input_define_gamepad_types)
//
////Nintendo 64
//input_icons(INPUT_GAMEPAD_TYPE_N64)
//.add("gamepad face south",         "A")
//.add("gamepad face east",          "B")
//.add("gamepad shoulder l",         "L")
//.add("gamepad shoulder r",         "R")
//.add("gamepad trigger l",          "Z")
//.add("gamepad start",              "start")
//.add("gamepad dpad up",            "dpad up")
//.add("gamepad dpad down",          "dpad down")
//.add("gamepad dpad left",          "dpad left")
//.add("gamepad dpad right",         "dpad right")
//.add("gamepad thumbstick l left",  "thumbstick left")
//.add("gamepad thumbstick l right", "thumbstick right")
//.add("gamepad thumbstick l up",    "thumbstick up")
//.add("gamepad thumbstick l down",  "thumbstick down")
//.add("gamepad thumbstick r left",  "C left")
//.add("gamepad thumbstick r right", "C right")
//.add("gamepad thumbstick r up",    "C up")
//.add("gamepad thumbstick r down",  "C down")
//
////Sega Saturn
//input_icons(INPUT_GAMEPAD_TYPE_SATURN)
//.add("gamepad face south", "A")
//.add("gamepad face east",  "B")
//.add("gamepad face west",  "X")
//.add("gamepad face north", "Y")
//.add("gamepad shoulder l", "L")
//.add("gamepad shoulder r", "Z")
//.add("gamepad trigger l",  "R")
//.add("gamepad trigger r",  "C")
//.add("gamepad select",     "mode")
//.add("gamepad start",      "start")
//.add("gamepad dpad up",    "dpad up")
//.add("gamepad dpad down",  "dpad down")
//.add("gamepad dpad left",  "dpad left")
//.add("gamepad dpad right", "dpad right")

#endregion
