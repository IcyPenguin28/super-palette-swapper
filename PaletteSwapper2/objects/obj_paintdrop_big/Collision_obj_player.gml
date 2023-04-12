/// @description Create FX and destroy

other.collectedBigDrops[index] = true;
instance_create_layer(x, y, "Instances", obj_ef_paintcollect);
if other.collectedBigDrops[0] && other.collectedBigDrops[1] && other.collectedBigDrops[2]
{
	audio_play_sound(snd_big_paintdrop_all, 0, false);
}
else
{
	audio_play_sound(snd_big_paintdrop, 0, false);
}
instance_destroy();
