/// @description Insert description here
// You can write your code in this editor

if hp > 0
{
	switch state
	{
		case ST_Boss.inactive:
			sprite_index = idleSprite;
			image_xscale = obj_player.x > x ? -1 : 1;
			if !instance_exists(obj_textbox) && instance_exists(myPreBossScene)
			{
				// Player triggered preboss scene and finished reading it. It's boss time!
				state = ST_Boss.prefight;
				statestep = 0;
			}
			break;
	
		case ST_Boss.prefight:
			sprite_index = idleSprite;
			image_xscale = obj_player.x > x ? -1 : 1;
			audio_stop_all();
			audio_play_sound(fightMusic, 0, true);
			displayHP = true;
			// TODO: Create proceedingWall B and place it over boss scene trigger
			break;
		
		case ST_Boss.idle:
			statestep = Boss_StateDurations.idle;
			sprite_index = idleSprite;
			image_xscale = obj_player.x > x ? -1 : 1;
			if (statestep > 0)
			{
				// in state
				// idle just means wait out the timer
				statestep --;
			
			}
			else
			{
				// End of state
				// Choose next one
				state = choose(ST_Boss.walk, ST_Boss.jump, ST_Boss.attack1, ST_Boss.attack2, ST_Boss.attack3);
				statestep = 0;
			}
			break;
		
		case ST_Boss.walk:
			statestep = Boss_StateDurations.walk;
			sprite_index = walkingSprite;
			image_xscale = obj_player.x > x ? -1 : 1;
			if (statestep > 0)
			{
				// in state
				// walking means changing x position based on direction
				// Vince shuffles backwards, so we subtract instead of add
				x -= image_xscale * walkSpd;
			}
			else
			{
				// End of state
				// Choose next one
				// Don't go back to idle, that'd be boring af
				state = choose(ST_Boss.jump, ST_Boss.attack1, ST_Boss.attack2, ST_Boss.attack3);
				statestep = 0;
			
			}
			break;
	
		case ST_Boss.jump:
			// Practically copied straight from Hunter
			// Sorry, not sorry
			var d = point_distance(
				jumpstartpos[0], jumpstartpos[1], jumptargetpos[0], jumptargetpos[1]);
			var _duration = 50 + d / 20;
			sprite_index = jumpingSprite;
		
			// In air
			if (statestep < _duration) {statestep --;}
			// Landing
			else
			{
				state = ST_Boss.idle;
				statestep = 0;
				break;
			}
			x = lerp(jumpstartpos[0], jumptargetpos[0], statestep/_duration);
			y = lerp(jumpstartpos[1], jumptargetpos[1], statestep/_duration) 
				- (100 + d/10)*(1-power(1-2*statestep/_duration, 2));	// Parabola added to y position = 1-(1-2x)^2
			break;
	
		case ST_Boss.attack1:
			// Spray: Basically instant Piranha Plant Side-B, but with obj_spraycloud.
			break;
	
		case ST_Boss.attack2:
			// Jet Cans: Uses propulsion from spraying his cans to zoom from one end of the arena to the other
			// Causes spray cloud to appear like it does in his attack 1 from his starting position
			break;
	
		case ST_Boss.attack3:
			// Can Spike: Spikes his yellow can on the ground, making extremely sharp angles with the floor and ceiling
			// Player must run away from the can until it slows down enough to pass by it
			break;
	}
}
else
{
	// Dead lmao
	hp = 0;
	displayHP = false;
	
	// TODO: summon boss defeated scene
}