waterBucket = true;
audio_play_sound(sound_watering, 7, false);
instance_create_layer(other.x, other.y, layer, oPowerup);
instance_destroy(other);