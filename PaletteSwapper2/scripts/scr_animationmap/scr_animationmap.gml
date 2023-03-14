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
		
	}

}  /*ANIMMAPEND*/;


