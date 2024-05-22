/// @description Insert description here
// You can write your code in this editor

// TODO: Fancy victory shit (like, the grand star thing in SMG, like THAT kinda fancy shit)

event_inherited();

var p = obj_player;

if instance_exists(p)
{
	if instance_place(x, y, obj_player)
	{
		// Maybe an animation where the player holds up the paint
		stageCleared = true;
	}
}


if stageCleared && !stepFlag
{
		// Goal celebration and results screen
		audio_stop_all();	// Stop music
		audio_play_sound(snd_victory_boss, 0, false, global.gain_bgm); // Play fanfare
		p.canMove = false;
		p.canJump = false;
		p.canAttack = false;
		p.canDash = false;
		p.canShoot = false;
		p.canBomb = false;
		
		instance_create_layer(x, y, "Instances", obj_ef_paintcollect);
		
		// Add new color to palette
		ini_open(global.active_savefile);	
		ini_write_real("Unlocked Colors", string(myCol), 1);
		ini_close();
		
		instance_create_layer(0, 0, "Instances", obj_results);	// Create results
		stepFlag = true;	// Prevent constant stage clear stuff
}

if !audio_is_playing(snd_victory_boss) && !audio_is_playing(mus_results) && stepFlag
{
	audio_play_sound(mus_results, 0, true, global.gain_bgm);	// Play results music
}