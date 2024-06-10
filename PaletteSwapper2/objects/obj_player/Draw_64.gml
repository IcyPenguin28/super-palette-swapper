/// @desc Debug

if (DEBUG)
{
	// Store state
	var _col = draw_get_color();
	var _font = draw_get_font();
	
	draw_set_font(fnt_dialogue);
	draw_set_color(c_black);
	draw_set_halign(fa_right);
	draw_set_valign(fa_bottom);
	
	draw_set_color(c_white);
	
	draw_text_block(display_get_gui_width(), display_get_gui_height(), 0.5,
		string("State: {0} {1}", state, ST_Player_string[abs(state)]),
		string("onGround: {0}", onGround),
		string("AttackState: {0}", attackState),
		string("isAttackingGround: {0}", isAttackingGround),
		string("isAttackingAir: {0}", isAttackingAir),
		string("hsp: {0}", hsp),
		string("vsp: {0}", vsp),
	);
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	//draw_text_block(0, 200, 0.5, spriteanimator.Layer(0));
	
	// Restore state
	draw_set_font(_font);
	draw_set_color(_col);
}
