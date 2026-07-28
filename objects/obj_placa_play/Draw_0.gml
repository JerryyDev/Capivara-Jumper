draw_self();

draw_set_font(fnt_play);
draw_set_colour(c_black);

draw_set_halign(1);
draw_set_valign(1);

draw_text_transformed(x, y, "Play", xs_t, ys_t, 0);

draw_set_colour(-1);
draw_set_font(-1);