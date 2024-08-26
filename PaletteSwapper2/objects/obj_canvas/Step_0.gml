/// @description Insert description here
// You can write your code in this editor
if instance_place(x, y, obj_player)
{
	// Maybe an animation where the player paints the canvas
	stageCleared = true;
}


if stageCleared && !stepFlag
{
		// Goal celebration and results screen
		image_index = 1;	// Switch to filled in canvas image
		audio_stop_all();	// Stop music
		audio_play_sound(snd_victory, 0, false, global.gain_bgm); // Play stage clear music
		obj_player.canMove = false;
		obj_player.canJump = false;
		obj_player.canAttack = false;
		obj_player.canDash = false;
		obj_player.canShoot = false;
		obj_player.canBomb = false;
		instance_create_layer(0, 0, "Instances", obj_results);
		stepFlag = true;	// Prevent constant stage clear stuff
}

if !audio_is_playing(snd_victory) && !audio_is_playing(mus_results) && stepFlag
{
	audio_play_sound(mus_results, 0, true, global.gain_bgm);	// Play results music
}