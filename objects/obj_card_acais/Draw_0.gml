draw_self();

draw_set_font(fnt_store);
draw_set_colour(c_black);

draw_text(x+6,y+2, " : " + string(global.acai));
draw_sprite_ext(spr_acai,2,x-11,y,1,1,0,c_white,1);

draw_set_font(-1);
draw_set_colour(-1);