/// @description Insert description here
// You can write your code in this editor
audio_play_sound(snd_small_paintdrop, 0, false, 1, 0, other.paintdropPitch);

// Change the pitch of the next pickup and set the timer that resets the pitch to default
other.paintstep = other.paintTime;
other.paintDropPitch += 0.1;
// show_debug_message(other.paintDropPitch);
instance_destroy();