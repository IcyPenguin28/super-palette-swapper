/// @desc 

// Inherit the parent event
event_inherited();

atk = 1;
spd = 2;

image_blend = make_color_rgb(29, 0, 51);
sprite_index = spr_spraycloud_ball;

life = 180;
lifestep = 0;

circradius = 10;
circcount = 8;
circ = array_create(8);

circscale = 0.5;

for (var i = 0; i < circcount; i++)
{
	circ[i] = {
		x : irandom_range(-circradius, circradius),
		y : irandom_range(-circradius, circradius),
		d : random_range(circradius/4, circradius/2),
		r : irandom_range(circradius-4, circradius),
		t : random(360),
	}
}

function Update()
{
	x += hsp;
	y += vsp;
	
	var c;
	for (var i = 0; i < circcount; i++)
	{
		c = circ[i];
		c.t += -(7 + i) * polarize(hsp > 0);
	}
	
	if (lifestep < life)
	{
		lifestep += 1;
		circscale = approach_value(circscale, 1, 0.1);
	}
	else
	{
		atk = 0;
		circscale -= 0.03;
		if ( circscale <= 0 )
		{
			instance_destroy();
		}
	}
}

function Draw()
{
	var c;
	var spr = sprite_index;
	
	for (var i = 0; i < circcount; i++)
	{
		c = circ[i];
		draw_sprite_ext(
			spr, 0,
			x + c.x + lengthdir_x(c.d, c.t),
			y + c.y + lengthdir_y(c.d, c.t),
			circscale*2*c.r/sprite_get_width(spr),
			circscale*2*c.r/sprite_get_height(spr),
			0,
			merge_color(0, image_blend, 0.8+0.2*(dsin(c.t)*0.5+0.5)),
			image_alpha
		);
	}
}
