/// @desc 

depth = -1000;

spriteanimator = new SpriteAnimator();
//spriteanimator.Layer(0).SetCallback(OnAnimationEnd);
spriteanimator.CopyAnimations_Struct(SPRITEANIMMAP[$ "andy"]);
spriteanimator.SetAnimationKey("defeat").UpdateAnimation(0);

image_speed = 0;
image_alpha = 0;

statestep = 0;
state = 0;

hsp = 0;
vsp = 0;
grav = 0.2;

texty = -400;
textalpha = 1;


