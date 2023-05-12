/// @desc 

var ts = obj_globalcontroller.timestepLevel;	// Timestep. Set to 0 when game is paused, global hitstop, etc.

TryStart();

RehitUpdate(ts);
Update(ts);
