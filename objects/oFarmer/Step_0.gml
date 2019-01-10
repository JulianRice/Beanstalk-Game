/// @description Movement & More

#region //Movement
//Setting up movement variables
keyLeft = keyboard_check(vk_left) || keyboard_check(ord("A"));
keyRight = keyboard_check(vk_right) || keyboard_check(ord("D"));
keyJump = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
keyRun = keyboard_check(vk_lshift);
keyAttack = keyboard_check(vk_space);
keyAttackEffect = keyboard_check_pressed(vk_space);
var move = keyRight - keyLeft;

//Movement
if (keyRun) {
	hsp = move * RUN;
}
else {
	hsp = move * WALK;
}

vsp = vsp + grv;
canJump--;
if (keyJump && canJump <= 0 && vsp < 1) {
	vsp = JUMP;
	if (footstepCounter >= 12)
		audio_play_sound(sound_jump, 5, false);
	canJump = 25;
}

//Collision Detection

if (place_meeting(x + hsp, y, oWall)) {
	while (!place_meeting(x + sign(hsp), y, oWall)) {
		x = x + sign(hsp);	
	}
	hsp = 0;
}
x += hsp;

if (place_meeting(x, y + vsp, oWall)) {
	while (!place_meeting(x, y + sign(vsp), oWall)) {
		y = y + sign(vsp);	
		falling = true;
	}
	vsp = 0;
	if (hsp != 0 && !falling) 
		instance_create_layer(x, y+4, layer, oLanding);
	if (falling)
		instance_create_layer(x, y+4, layer, oLanding);
	falling = false;
}
y += vsp;


#endregion
var hit1 = instance_place(x+24, y, oWallX);
var hit1b = instance_place(x+24, y-4, oWallX);
var hit2 = instance_place(x-24, y, oWallX);
var hit2b = instance_place(x-24, y-4, oWallX);
var sound2 = irandom_range(0, 1);
if (sound2 == 0) 
	destroy = sound_plant_break_1;
else
	destroy = sound_plant_break_2;
	
if (keyAttack && (hit1 || hit1b || hit2 || hit2b)) {
		if (image_xscale == 1 && (hit1 || hit1b)) {
			if (hit1) {
				with (hit1) {
					instance_create_layer(x, y, layer, oEffectRemoveGround);
					instance_destroy();
				}
			}
			else {
				with (hit1b) {
					instance_create_layer(x, y, layer, oEffectRemoveGround);
					instance_destroy();
				}
			}
		}
		else if (image_xscale == -1 && (hit2 || hit2b)) {
			if (hit2) {
				with (hit2) {
					instance_create_layer(x, y, layer, oEffectRemoveGround);
					instance_destroy();
				}
			}
			else {
				with (hit2b) {
					instance_create_layer(x, y, layer, oEffectRemoveGround);
					instance_destroy();
				}
			}
		}
		else {
			if (hit1) {
				with (hit1) {
					instance_create_layer(x, y, layer, oEffectRemoveGround);
					instance_destroy();
				}
			}
			if (hit2) {
				with (hit2) {
					instance_create_layer(x, y, layer, oEffectRemoveGround);
					instance_destroy();
				}
			}
		}
		audio_play_sound(destroy, 3, false);
		global._score += 5;
}

if (jumpIncreaseCounter == 300) {
	JUMP -= 0.1;
	jumpIncreaseCounter = 0;
}
else
	jumpIncreaseCounter++;

if (footstepCounter >= 12 && hsp != 0 && vsp == 0) {
	audio_play_sound(sound_footstep, 2, 0);
	footstepCounter = 0;
}
else
	footstepCounter++;

#region //Animation
if (hsp != 0) {
	image_xscale = sign(hsp);
}
if (!place_meeting(x, y+1, oWallX) && keyAttack) {
	sprite_index = sJumpAttack;	
}
else if (!place_meeting(x, y+1, oWall)) {
	sprite_index = sFarmerJump;
	if (image_index > image_number - 1) 
		image_speed = 0;
}
else if (keyAttack) {
	sprite_index = sFarmerAttack;	
}
else {
	image_speed = 1;
	if (hsp == 0)
		sprite_index = sFarmer;
	else
		sprite_index = sFarmerWalk;
		//sprite_index = sFarmerRun;
}
if (keyAttackEffect) {
	with (instance_create_layer(oFarmer.x, oFarmer.y-24, layer, oEffect))
		image_xscale = sign(other.hsp);
	audio_play_sound(sound_sickle, 2, 0);
}
#endregion

if (waterBucket) {
	global.RATE -= 0.02;
	waterBucket = false;
}

if (hedgeTrimmer) {
	global.GROUND_RATE += 15;
	hedgeTrimmer = false;
}

if (addScore % 30 == 0) {
	global._score++;
}
addScore++;

if (y > camera_get_view_y(global.cam) + camera_get_view_height(global.cam) + 32)
	room_goto(3);