/// @description Insert description here
// You can write your code in this editor

if (state == ST_Boss_Vince.walk)
{
	var _ps = part_system_create();
	part_system_draw_order(_ps, true);

	//Emitter
	var _ptype1 = part_type_create();
	part_type_shape(_ptype1, pt_shape_disk);
	part_type_size(_ptype1, 0.5, 1, -0.05, 0);
	part_type_scale(_ptype1, 0.2, 0.2);
	part_type_speed(_ptype1, 0, 1, -0.05, 0);

	part_type_direction(_ptype1, radtodeg(arccos(-hsp)), radtodeg(arccos(-hsp)), 0, 0);
	part_type_gravity(_ptype1, 0.05, 90);
	part_type_orientation(_ptype1, 0, 0, 0, 0, false);
	part_type_colour3(_ptype1, $FFFFFF, $FFFFFF, $FFFFFF);
	// part_type_alpha3(_ptype1, 1, 1, 0);
	part_type_blend(_ptype1, false);
	part_type_life(_ptype1, 20, 30);

	var _pemit1 = part_emitter_create(_ps);
	part_emitter_region(_ps, _pemit1, -8, 8, -8, 8, ps_shape_rectangle, ps_distr_linear);
	part_emitter_burst(_ps, _pemit1, _ptype1, 2);

	part_system_position(_ps, x, bbox_bottom);
}