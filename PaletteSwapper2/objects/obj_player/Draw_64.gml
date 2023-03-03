/// @desc Debug

if (debug)
{
	// Store state
	var _col = draw_get_color();
	var _font = draw_get_font();
	
	draw_set_font(fnt_dialogue);
	draw_set_color(c_black);
	draw_set_halign(fa_right);
	draw_set_valign(fa_bottom);
	
	draw_text_block(display_get_gui_width(), display_get_gui_height(), 0.5,
		string("AttackState: {0}", attackState),
		string("isAttackingGround: {0}", isAttackingGround),
		string("isAttackingAir: {0}", isAttackingAir),
		string("vsp: {0}", vsp),
	);
	
	// Restore state
	draw_set_font(_font);
	draw_set_color(_col);
}
