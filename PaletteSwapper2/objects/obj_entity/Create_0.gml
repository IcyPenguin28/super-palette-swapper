/// @desc 

event_user(15);	// Entity Functions
event_user(14);	// Unique Methods

spriteanimator = 0;

state = 0;
trystart = false;

hitstopstep = 0;
flashTime = 0;

// Stats
hpMax = 0;
hp = 0;
hpDisplayTime = 120;
hpDisplayStep = 0;
def = 0; // The amount of damage that is protected against

kbres = 0; // The amount of knockback that is protected against (in pixels)

// Space
hsp = 0;
vsp = 0;
dir = 1;
grav = 0.25;
onGround = false;	// Update via ProcessCollision() Result

// Rehit Queue
rehitqueuecount = 16;	// Max number of projectiles to avoid rehits of
rehitqueueindex = 0;	// Index of array to add to
rehitqueueinst = array_create(rehitqueuecount, noone);	// Instances in array cannot hit again...
rehitqueuetimer = array_create(rehitqueuecount, noone);	// ...until their timer decrements to 0

