/*SPRITEANIM*/

/*
	This is managed by the 
*/

// Format:
// [duration, sprite, image, x, y, flag]

#macro SPRITEANIMMAP global.g_spriteanimationmap
SPRITEANIMMAP = /*ANIMMAPSTART*/ {
	andy : {
		idle : [
			[12, spr_andy_idle, 0, 0, 0, 0],
			[8,  spr_andy_idle, 1, 0, 0, 0],
			[5,  spr_andy_idle, 2, 0, 0, 0],
			[8,  spr_andy_idle, 3, 0, 0, 0],
		],
		
		walk : [
			[4, spr_andy_walk, 0, 0, 0, 0],
			[8, spr_andy_walk, 1, 0, 0, 0],
			[4, spr_andy_walk, 2, 0, 0, 0],
			[8, spr_andy_walk, 3, 0, 0, 0],
		],
		
		rising : [
			[2, spr_andy_jump, 0, 0, 0, 0],
			[2,  spr_andy_jump, 1, 0, 0, 0],
			[infinity,  spr_andy_jump, 2, 0, 0, 0],
		],
		
		falling : [
			[infinity,  spr_andy_jump, 1, 0, 0, 0],
		],
		
		slam : [
			[3, spr_andy_slam, 0, 0, 0, 0],
			[3, spr_andy_slam, 1, 0, 0, 0],
			[3, spr_andy_slam, 2, 0, 0, 0],
			[3, spr_andy_slam, 3, 0, 0, 0],
			[3, spr_andy_slam, 4, 0, 0, 0],
		],
		
		// Ground Swipe 1
		attack1a : [	// Startup frames
			[2, spr_andy_attack_ground_0, 0, 0, 0, 0],
			[2, spr_andy_attack_ground_0, 1, 0, 0, 0],
			[10, spr_andy_attack_ground_0, 2, 1, 0, 0],
			[4, spr_andy_attack_ground_0, 3, 0, 0, 0],
		],
		
		// Ground Swipe 2
		attack2a : [	// Startup frames
			[2, spr_andy_attack_ground_1, 0, 0, 0, 0],
			[2, spr_andy_attack_ground_1, 1, 2, 0, 0],
			[7, spr_andy_attack_ground_1, 2, 1, 0, 0],
			[4, spr_andy_attack_ground_1, 3, 0, 0, 0],
			[4, spr_andy_attack_ground_1, 3, 0, 0, 0],
		],
		
		// Ground Swipe 3
		attack3a : [	// Startup frames
			[2, spr_andy_attack_ground_2, 0, 2, 0, 0],
			[2, spr_andy_attack_ground_2, 1, 2, 0, 0],
			[10, spr_andy_attack_ground_2, 2, 6, 0, 0],
			[6, spr_andy_attack_ground_2, 3, 3, 0, 0],
		],
		
		// Dashing
		dash : [
			[18, spr_andy_dash, 0, 0, 0, 0],
			[1, spr_andy_dash, 1, 0, 0, 0],
			[1, spr_andy_dash, 2, 0, 0, 0],
		],
		
		// Defeat
		defeat : [
			[0, spr_andy_idle, 0, 0, 0, 0],
		],
	},
	
	vince : {
		idle : [
			[8, spr_vince_idle, 0, 0, 0, 0],
			[8, spr_vince_idle, 1, 0, 0, 0],
			[8, spr_vince_idle, 2, 0, 0, 0],
			[8, spr_vince_idle, 3, 0, 0, 0],
		],
		
		move_f : [
			[8, spr_vince_move_f, 0, 0, 0, 0],
			[8, spr_vince_move_f, 1, 0, 0, 0],
			[8, spr_vince_move_f, 2, 0, 0, 0],
			[8, spr_vince_move_f, 3, 0, 0, 0],
		],
		
		move_b : [
			[8, spr_vince_move_b, 0, 0, 0, 0],
			[8, spr_vince_move_b, 1, 0, 0, 0],
			[8, spr_vince_move_b, 2, 0, 0, 0],
			[8, spr_vince_move_b, 4, 0, 0, 0],
		],
		
		dash : [
			[2, spr_vince_dash, 0, 0, 0, 0],
			[3, spr_vince_dash, 1, 0, 0, 0],
			[3, spr_vince_dash, 2, 0, 0, FL_SpriteAnimator_Frame.loop],
			[3, spr_vince_dash, 3, 0, 0, 0],
		],
		
		// Dash start
		dash0 : [
			[6, spr_vince_dash, 0, 0, 0, 0],
			[6, spr_vince_dash, 1, 0, 0, FL_SpriteAnimator_Frame.loop],
		],
		
		// Dash loop
		dash1 : [
			[3, spr_vince_dash, 2, 0, 0, 0],
			[3, spr_vince_dash, 3, 0, 0, 0],
		],
		
		// All purpose jump
		jump : [
			[2, spr_vince_jump, 0, 0, 0, 0],
			[0, spr_vince_jump, 1, 0, 0, FL_SpriteAnimator_Frame.loop],
		],
		
		// Ground frames
		jump_squat : [
			[0, spr_vince_jump, 0, 0, 0, 0],
		],
		
		// Air frames
		jump_rise : [
			[0, spr_vince_jump, 1, 0, 0, 0],
		],
		
		// Reel back
		throw0 : [
			[2, spr_vince_throw, 0, 0, 0, 0],
			[8, spr_vince_throw, 1, 0, 0, 0],
			[0, spr_vince_throw, 2, 0, 0, FL_SpriteAnimator_Frame.loop],
		],
		
		// Throw
		throw1 : [
			[2, spr_vince_throw, 3, 0, 0, 0],
			[10, spr_vince_throw, 4, 0, 0, FL_SpriteAnimator_Frame.loop],
		],
		
		// Spray
		spray0 : [
			[6, spr_vince_spray, 0, 0, 0, 0],
		],
		
		spray1 : [
			[2, spr_vince_spray, 1, 0, 0, FL_SpriteAnimator_Frame.loop],
			[2, spr_vince_spray, 2, 0, 0, 0],
		],
		
		// Defeat
		defeat : [
			[0, spr_vince_throw, 4, 0, 0, 0],
		],
	}

}  /*ANIMMAPEND*/;


