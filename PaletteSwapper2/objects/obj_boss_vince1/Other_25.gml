/// @desc Update()

// Inherit the parent event
event_inherited();

function OnDefeat()
{
	SetState(ST_Boss_Vince.defeat);
	return 1;	// Prevent destroy
}

function Update(ts)
{
	/*
		Idle > Walk > Attack > Idle
		Idle > Attack > Idle
	*/
	
	// True when on house platforms. Used in some decision making
	var _onplatform = y < ystart-16;
	
	var p = instance_exists(obj_player)? obj_player: noone;
	
	switch(state)
	{
		// Inactive =========================================================
		case(ST_Boss_Vince.inactive):
			sprite_index = idleSprite;
			if (p) {image_xscale = obj_player.x > x ? 1 : -1;}
			
			if !instance_exists(obj_textbox) && instance_exists(myPreBossScene)
			{
				// Player triggered preboss scene and finished reading it. It's boss time!
				state = ST_Boss_Vince.prefight;
				statestep = 0;
			}
			
			break;
		
		// Prefight ====================================================================================
		case(-ST_Boss_Vince.prefight):
			spriteanimator.SetAnimationKey("idle");
			break;
			
		case(ST_Boss_Vince.prefight):
			sprite_index = idleSprite;
			if (p) {image_xscale = obj_player.x > x ? 1 : -1;}
			
			audio_stop_all();
			audio_play_sound(fightMusic, 0, true, global.gain_bgm);
			displayHP = true;
			
			// Activate wall
			if ( instance_exists(inst_introstage_solid_boss0) )
			{
				inst_introstage_solid_boss0.active = true;
			}
			
			// Set Discord Status
			// TODO: Maybe get a boss icon template and change the large image to that?
			with (obj_discord)
			{
				var smimgtxt = "playing_as_andy"	// "SMall IMaGe TeXT"
				// Note that instances get loaded after room creation code. Worry about this later. Fuck you, future Scott :)
	
				np_setpresence("Memory Lane", "Fighting Vince", "memory_lane", smimgtxt);
			}
			
			SetState(ST_Boss_Vince.idle);
			
			break;
		
		// Idle ====================================================================================
		case(-ST_Boss_Vince.idle):	// State Start
			spriteanimator.SetAnimationKey("idle");
			statestep = Boss_StateDurations.idle;
			break;
			
		case(ST_Boss_Vince.idle):		// State Step
			if (p) {image_xscale = obj_player.x > x ? 1 : -1;}
			
			if (statestep > 0)
			{
				statestep -= ts;
			}
			else
			{
				// Omit walk if on platform
				if (_onplatform)
				{
					state = choose(ST_Boss_Vince.jump, ST_Boss_Vince.attack1, ST_Boss_Vince.attack2, ST_Boss_Vince.attack3);
				}
				// Walk is available
				else
				{
					state = choose(ST_Boss_Vince.walk, ST_Boss_Vince.jump, ST_Boss_Vince.attack1, ST_Boss_Vince.attack2, ST_Boss_Vince.attack3);
				}
				
				SetState(state);
			}
			break;
		
		// Walk ====================================================================================
		case(-ST_Boss_Vince.walk):
			statestep = Boss_StateDurations.walk;
			
			if (p)
			{
				hsp = -polarize(obj_player.x-x);
				spriteanimator.SetAnimationKey((sign(obj_player.x-x) == sign(hsp))? "move_f": "move_b");
			}
			
			// Walk towards center if too far
			if ( abs(obj_camera.xcenter-x) > 200 )
			{
				hsp = polarize(obj_camera.xcenter-x);
			}
			
			break;
		
		case(ST_Boss_Vince.walk):
			if (p)
			{
				image_xscale = obj_player.x > x ? 1 : -1;
			
				// Set animation based on direction to player and hsp
				spriteanimator.SetAnimationKey((sign(obj_player.x-x) == sign(hsp))? "move_f": "move_b");
			}
			
			if (statestep > 0)
			{
				x += hsp * ts;
				statestep -= ts;
			}
			else
			{
				// Don't go back to idle, that'd be boring af
				state = choose(ST_Boss_Vince.jump, ST_Boss_Vince.attack1, ST_Boss_Vince.attack2, ST_Boss_Vince.attack3);
				SetState(state);
			}
			break;
		
		// Yump ====================================================================================
		case(-ST_Boss_Vince.jump):
			spriteanimator.SetAnimationKey("jump_rise");
			statestep = 0;	// Count UP from here
			jumpstartpos = [x, y];
			jumptargetpos = jumpPoints[irandom(array_length(jumpPoints)-1)];
			break;
			
		case(ST_Boss_Vince.jump):
			// Practically copied straight from Hunter
			// Sorry, not sorry
			var d = point_distance(
				jumpstartpos[0], jumpstartpos[1], jumptargetpos[0], jumptargetpos[1]);
			var _duration = 50 + d / 20;
			
			// In air
			statestep = approach_value(statestep, _duration, ts);
			
			x = lerp(jumpstartpos[0], jumptargetpos[0], statestep/_duration);
			y = lerp(jumpstartpos[1], jumptargetpos[1], statestep/_duration) 
				- (100 + d/10)*(1-power(1-2*statestep/_duration, 2));	// Parabola added to y position = 1-(1-2x)^2
			
			// Landing
			if (statestep >= _duration)
			{
				x = jumptargetpos[0];
				y = jumptargetpos[1];
				
				SetState(_onplatform? ST_Boss_Vince.idle: ST_Boss_Vince.walk);
				break;
			}
			
			break;
		
		// Attack 1 ====================================================================================
		// Spray: Basically instant Piranha Plant Side-B, but with obj_spraycloud.
		case(-ST_Boss_Vince.attack1):
			spriteanimator.SetAnimationKey("spray0");
			statestep = 0;
			break;
		
		case(ST_Boss_Vince.attack1):
			
			if ( statestep == 0 )
			{
				// Spray
				if ( spriteanimator.Layer(0).HasCompleted(true) )
				{
					spriteanimator.SetAnimationKey("spray1");
					statestep = 1;
					
					var _inst = instance_create_depth(x+image_xscale*10, y, depth-10, obj_spraycloud);
					_inst.hsp = image_xscale;
				}
			}
			else
			{
				if (statestep < 60) {statestep += ts;}
				else
				{
					SetState(ST_Boss_Vince.idle);
				}
			}
			break;
		
		// Attack 2 ================================================================================
		// Jet Cans: Uses propulsion from spraying his cans to zoom from one end of the arena to the other
		// Causes spray cloud to appear like it does in his attack 1 from his starting position
		case(-ST_Boss_Vince.attack2):
			spriteanimator.SetAnimationKey("dash0");
			statestep = 0;
			hsp = 0;
			image_xscale = polarize(obj_camera.xcenter-x);	// Dash towards center of screen
			break;
		
		case(ST_Boss_Vince.attack2):
			if ( statestep == 0 )
			{
				// Spray
				if ( spriteanimator.Layer(0).HasCompleted(true) )
				{
					spriteanimator.SetAnimationKey("dash1");
					statestep = 1;
					
					var _inst = instance_create_depth(x-image_xscale*5, y, depth-10, obj_spraycloud);
					_inst.hsp = -image_xscale / 2;
				}
			}
			else
			{
				hsp = approach_value(hsp, 4*image_xscale, 0.5*ts);
				x += hsp;
				
				// TODO: Have better way to stop dashing when on platforms
				if (statestep < (_onplatform? (330/4): 60)) {statestep += ts;}
				else
				{
					SetState(_onplatform? ST_Boss_Vince.idle: ST_Boss_Vince.walk);
				}
			}
			break;
		
		// Attack 3 ================================================================================
		// Can Spike: Spikes his yellow can on the ground, making extremely sharp angles with the floor and ceiling
		// Player must run away from the can until it slows down enough to pass by it
		case(-ST_Boss_Vince.attack3):
			spriteanimator.SetAnimationKey("throw0");
			statestep = 0;
			break;
		
		case(ST_Boss_Vince.attack3):
			if ( statestep == 0 )
			{
				// Spray
				if ( spriteanimator.Layer(0).HasCompleted(true) )
				{
					spriteanimator.SetAnimationKey("throw1");
					statestep = 1;
					
					var _inst = instance_create_depth(x+image_xscale*10, y, depth-10, obj_vince_can);
					_inst.hsp = image_xscale;
					_inst.vsp = 6 * polarize(irandom(1) > 0);
				}
			}
			else
			{
				if (statestep < 60) {statestep += ts;}
				else
				{
					SetState(ST_Boss_Vince.idle);
				}
			}
			break;
		
		// Defeat ================================================================================
		case(-ST_Boss_Vince.defeat):
			spriteanimator.SetAnimationKey("defeat");
			statestep = 0;
			
			displayHP = false;
			if ( instance_exists(inst_introstage_solid_boss0) )
			{
				inst_introstage_solid_boss0.active = false;
			}
			if ( instance_exists(inst_introstage_solid_boss1) )
			{
				inst_introstage_solid_boss1.active = false;
			}
		
			if !(instance_exists(myPostBossScene))
			{
				instance_create_layer(0, 0, "Instances", myPostBossScene);
			}
			
			atk = 0;
			
			audio_stop_sound(fightMusic);
			break;
		
		case(ST_Boss_Vince.defeat):
			hsp = 0;
			image_xscale = polarize(p.x-x);
			
			if (!onGround)
			{
				vsp += 0.16;
				
				x += hsp;
				y += vsp;
				
				if ( ProcessCollision(true) )
				{
					onGround = true;
					vsp = 0;
				}
			}
			
			break;
	}
	
	spriteanimator.UpdateAnimation(ts);
}

function Draw()
{
	var _shader = shader_current();
	
	if (self.flashTime > 0)
	{
		shader_set(shd_flash);
	}
	spriteanimator.DrawLayers(x, y, c_white, image_alpha, image_xscale, image_yscale, 0);
	
	if (self.flashTime > 0)
	{
		self.flashTime --;
	}
	else
	{
		self.flashTime = 0;
		shader_set(_shader);
	}
}

