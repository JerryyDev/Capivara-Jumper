draw_self();

draw_set_font(fnt_store);
draw_set_colour(c_white);

draw_text(x+3,y+4," : " + string(custo));
draw_sprite_ext(spr_acai,2,x-16,y,1,1,0,c_white,1);

draw_set_colour(-1);
draw_set_font(-1);