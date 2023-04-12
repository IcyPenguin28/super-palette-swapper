/*
	Last Updated: 3/8/23
	
	Keys are case-INsensitive, meaning "player_idle" and "Player_Idle" will be treated as the same
	
	The animator itself has an animation pool, as well as each individual layer.
	To add an animation to ALL layers, set it through the animator. ( Animator.DefineAnimation() )
	To add an animation to ONE layer, set it through the target layer.  ( Animator.Layer(0).DefineAnimation() )
*/

enum FL_SpriteAnimator_Frame
{
	loop = 1<<0,
	stop = 1<<1,
	xflip = 1<<2,
	yflip = 1<<3,
	hide = 1<<4,
}

function SpriteAnimator(_numlayers=1) constructor
{
	static toString = function()
	{
		var out = "{" +
			"Animations: " + string(variable_struct_names_count(animationpool)) +
			", Speed: " + string(animationspeed) +
			", Layers: " + string(layercount) +
		"}";
		
		return out;
	}
	
	// Each layer is drawn sequentially
	function SpriteAnimator_Layer(_rootanimator) constructor
	{
		root = _rootanimator;
		
		enabled = true;
		loopcallback = -1;	// Called when animation is completed. Signature: Callback()
		
		animationpool = {};
		animationkey = "";
		animationkeylast = "";
		animationspeed = 1;
		animationlooppos = 0;
		haslooped = false;
	
		animationqueue = array_create(16);
		animationqueueindex = 0;
		animationqueuecount = 0;
		
		animationstep = 0;	// Current frame of animation
		animationsteplast = 0;	// Used for comparisons
		animationstepcount = 0;	// Number of frames in active animation
		animationposition = 0;	// Current position of animation [0-1]
		
		activeanimation = 0;
		activeframedata = [0,0,0,0,0,0];	// [duration,sprite,image,x,y,flag]
		activeframeindex = 0;
		activeframeindexlast = 0;
		activeframestep = 0;
		activeanimationsize = 0;
		activenetframes = 0;
		
		sprite = 0;
		image = 0;
		x = 0;
		y = 0;
		flag = 0;
		duration = 0;
		
		static toString = function()
		{
			return "{" +
				"Key: " + string(animationkey) +
				", Step: " + string(animationstep) +
				" (" + string(activeframestep) + ")" +
				", Frame: " + string(activeframeindex) +
				", Active: " + string(activeframedata) +
			"}";
		}
		
		function FrameIs(_frame) {return floor(animationstep) == _frame;}
		function FrameElapsed(_frame) {return floor(animationstep) > _frame;}
		
		function GetAnimationFrame() {return animationstep;}
		function GetAnimationPosition() {return animationposition;}
		
		function KeyExists(key)
		{
			return animationpool != -1? variable_struct_exists(animationpool, string_upper(key)): false;
		}
		
		function SetCallback(_function)
		{
			loopcallback = _function;
		}
		
		function HasCompleted(clear_on_true=false)
		{
			if (haslooped && clear_on_true)
			{
				haslooped = false;
				return true;
			}
		
			return haslooped;
		}
		
		function SetAnimationSpeed(_speed)
		{
			animationspeed = _speed;
			return self;
		}
		
		function DefineAnimation(key, animation)
		{
			key = string_upper(key);
			animationpool[$ key] = animation;
			return self;
		}
		
		// Copies animations from struct {key: animation}
		function CopyAnimations_Struct(_animationstruct, _overwrite=true)
		{
			var keys = variable_struct_get_names(_animationstruct);
			var n = array_length(keys);
			var k;
			
			for (var i = 0; i < n; i++)
			{
				k = string_upper(k);
				if ( _overwrite || !KeyExists(k) )
				{
					DefineAnimation(keys[i], _animationstruct[$ k]);
				}
			}
		}
		
		// Copies animations from ds map {key: animation}
		function CopyAnimations_Map(_animationmap, _overwrite=true)
		{
			var k = ds_map_find_first(_animationmap);
			
			while ( ds_map_exists(_animationmap, k) )
			{
				if ( _overwrite || !KeyExists(k) )
				{
					DefineAnimation(k, _animationmap[? k]);
					k = ds_map_find_next(_animationmap, k);
				}
			}
		}
		
		function SetAnimationKey(key)
		{
			animationkey = string_upper(key);
			ClearAnimationQueue();
			return self;
		}
		
		function NextAnimation()
		{
			if (trkactive)
			{
				animationstep = trkactive.FrameCount();
			}
			UpdateAnimation(0);
		
			return self;
		}
		
		function QueueAnimationKey(key)
		{
			animationqueue[animationqueuecount] = string_upper(key);
			animationqueuecount++;
			return self;
		}
	
		/// @arg key1,key2,...
		function QueueAnimationKeys()
		{
			for (var i = 0; i < argument_count; i++)
			{
				QueueAnimationKey(argument[i]);
			}
			return self;
		}
	
		function ClearAnimationQueue()
		{
			animationqueueindex = 0;
			animationqueuecount = 0;
			return self;
		}
		
		function UpdateAnimation(ts)
		{
			var _doupdate = 1;
			var _animationended = false;
		
			// Change Animation
			if (animationkey != animationkeylast)
			{
				animationkeylast = animationkey;
				animationstep = 0;
				animationsteplast = -1;
				animationposition = 0;
				animationlooppos = 0;
				
				activenetframes = 0;
				activeframestep = 0;
				activeframeindex = 0;
				activeframeindexlast = -1;
				activeloopindex = 0;
				
				haslooped = false;
				
				activeanimation = animationpool[$ animationkey];
				
				if ( is_array(activeanimation) )
				{
					activeframedata = [0,0,0,0,0,0];
					activeanimationsize = array_length(activeanimation)
					
					array_copy(activeframedata, 0, activeanimation[activeframeindex], 0, array_length(activeanimation[activeframeindex]));
					
					// Count net frames
					for (var i = 0; i < animationstepcount; i++)
					{
						activenetframes += activeanimation[i][0];
					}
				}
				
				_doupdate = 0;
			}
		
			// Update Animation
			if ( is_array(activeanimation) )
			{
				animationstep = animationstep+animationspeed*_doupdate*ts;
				activeframestep = activeframestep+animationspeed*_doupdate*ts;
				
				// Move to next frame
				if ( activeframestep >= activeframedata[0] )
				{
					activeframestep -= activeframedata[0];
					activeframeindex += 1;
					
					// End of animation
					if (activeframeindex >= activeanimationsize)
					{
						_animationended = true;
						haslooped = true;
				
						// Move to next in queue
						if ( animationqueueindex < animationqueuecount )
						{
							animationkey = animationqueue[animationqueueindex];
							animationqueueindex += 1;
							UpdateAnimation(0);
						}
						// Loop animation
						else
						{
							activeframeindex = activeloopindex;
							animationstep = 0;
							
							var d = animationstepcount-animationlooppos;
							if (d > 0)
							{
								while (animationstep < animationlooppos) {animationstep += d;}
								while (animationstep >= animationstepcount) {animationstep -= d;}
							}
						}
					}
				}
				
				animationposition = animationstep / activenetframes;
			
				// Update Output
				if ( activeframeindex != activeframeindexlast )	// Frame is different from last
				{
					activeframeindexlast = activeframeindex;
					
					activeframedata = [0,0,0,0,0,0];
					array_copy(activeframedata, 0, activeanimation[activeframeindex], 0, array_length(activeanimation[activeframeindex]));
					
					if ( activeframedata[1] >= 0 )
					{
						sprite = activeframedata[1];
					}
					
					image = activeframedata[2];
					x = activeframedata[3];
					y = activeframedata[4];
					flag = activeframedata[5];
					
				}
				
				if (_animationended && loopcallback != -1)
				{
					loopcallback();
				}
			}
			
			return _animationended;
		}
		
		function DrawLayer(_x, _y, color=c_white, alpha=1, xscale=1, yscale=1, rot=0)
		{
			if (flag & FL_SpriteAnimator_Frame.hide)
			{
				return;
			}
			
			var _xs = xscale;
			var _ys = yscale;
			
			if (flag & FL_SpriteAnimator_Frame.xflip) {_xs *= -1;}
			if (flag & FL_SpriteAnimator_Frame.yflip) {_ys *= -1;}
			
			_x += _xs * x;
			_y += _ys * y;
			
			draw_sprite_ext(sprite, image, _x, _y, _xs, _ys, 0, color, alpha);
		}
	}
	
	animationpool = {};
	animationspeed = 1;
	haslooped = 0;
	
	layers = [];
	layercount = 0;
	
	// DATA ===================================================================
	
	function Layer(index) {return layers[index];}
	function LayerCount(index) {return layercount;}
	
	// Adds and returns newly created layer
	function AddLayer()
	{
		var lyr = new SpriteAnimator_Layer(self);
		layers[layercount] = lyr;
		layercount += 1;
		lyr.CopyAnimations(animationpool, true);
		return lyr;
	}
	
	// Initializes number of layers to fit given number
	function InitializeLayers(_layercount)
	{
		// Remove layers
		while ( layercount > _layercount )
		{
			delete layers[layercount]
			layercount -= 1;
		}
		
		// Create layers
		while ( layercount < _layercount )
		{
			layers[layercount] = new SpriteAnimator_Layer(self);
			layercount += 1;
		}
		
		return self;
	}
	
	// Adds animation to pool for all layers
	function DefineAnimation(key, animationsequence)
	{
		key = string_upper(key);
		animationpool[$ key] = animationsequence;
		
		for (var i = 0; i < layercount; i++) {layers[i].DefineAnimation(key, animationsequence);}
		return self;
	}
	
	// Copies animations from struct {key: animation}
	function CopyAnimations_Struct(_animationstruct, _overwrite=true)
	{
		var keys = variable_struct_get_names(_animationstruct);
		var n = array_length(keys);
			
		for (var i = 0; i < n; i++)
		{
			if ( _overwrite || !variable_struct_exists(animationpool, keys[i]) )
			{
				DefineAnimation(keys[i], _animationstruct[$ keys[i]]);
			}
		}
		
		return self;
	}
	
	// Copies animations from ds map {key: animation}
	function CopyAnimations_Map(_animationmap, _overwrite=true)
	{
		var k = ds_map_find_first(_animationmap);
			
		while ( ds_map_exists(_animationmap, k) )
		{
			if ( _overwrite || !variable_struct_exists(animationpool, k) )
			{
				DefineAnimation(k, _animationmap[? k]);
				k = ds_map_find_next(_animationmap, k);
			}
		}
		
		return self;
	}
	
	// CONTROL ==========================================================================
	
	// Enables/Disables layer at index
	function SetLayerEnabled(index, enabled)
	{
		layers[index].enabled = enabled;
		return self;
	}
	
	// Sets next animation key for all layers to play
	function SetAnimationKey(key)
	{
		for (var i = 0; i < layercount; i++) {layers[i].SetAnimationKey(key);}
		return self;
	}
	
	// Queues animation key to play after animation finishes
	function QueueAnimationKey(key)
	{
		for (var i = 0; i < layercount; i++) {layers[i].QueueAnimationKey(key);}
		return self;
	}
	
	// Clears queued animations
	function ClearAnimationQueue()
	{
		for (var i = 0; i < layercount; i++) {layers[i].ClearAnimationQueue();}
		return self;
	}
	
	// OUPTUT ==========================================================================
	
	// Progresses animation for all enabled layers
	function UpdateAnimation(ts)
	{
		var _updated = 0;
		for (var i = 0; i < layercount; i++)
		{
			if ( layers[i].enabled )
			{
				if ( layers[i].UpdateAnimation(ts * animationspeed) )
				{
					_updated |= 1 << i;
				}
			}
		}
		
		return _updated;
	}
	
	function DrawLayers(x, y, color=c_white, alpha=1, xscale=1, yscale=1, rot=0)
	{
		for (var i = 0; i < layercount; i++)
		{
			if ( layers[i].enabled )
			{
				layers[i].DrawLayer(x, y, color, alpha, xscale, yscale, rot);
			}
		}
	}
	
	// Constructor
	if (_numlayers > 0)
	{
		InitializeLayers(_numlayers);
	}
}
