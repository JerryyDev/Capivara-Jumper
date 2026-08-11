draw_self();

draw_set_font(fnt_play);
draw_set_halign(fa_center); 
draw_set_valign(fa_middle); 

draw_set_colour(c_black);
draw_text_transformed(x, y, "Play", image_xscale, image_yscale, image_angle);

draw_set_colour(c_white);
draw_set_font(-1);