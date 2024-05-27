/// @description Insert description here
// You can write your code in this editor

if (other != obj_crate)
{
	if (beginSlam)
	{
		// if slamming, can jump on enemy heads
		// check if above enemy and going towards it
		if (vsp > 0 && y < other.y)
		{
			other.TakeDamage(slamPower, self);
			recoiling = true;
			canDash = true;
			beginSlam = false;
			vsp = -jumpSpd * 1.3;
			obj_camera.shakeMagY = 10;
			obj_camera.shakeTime = 1;
			audio_play_sound(snd_slam, 0, false, global.gain_sfx);
			SetState(ST_Player.neutral);
		}
	}
	else
	{
		TakeDamage(other.atk, other);
	}
}