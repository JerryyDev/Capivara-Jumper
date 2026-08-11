draw_sprite_ext(sprite_index, image_index, x, y, card_scale, card_scale, 0, c_white, 1);

draw_sprite_ext(sprite_skin,0,x+8,y+3,card_scale,card_scale,0,c_white,1);
draw_sprite_ext(spr_acai,2,x - 14,y+40,card_scale,card_scale,0,c_white,1);

draw_set_font(fnt_play);
draw_set_colour(c_white);
draw_text_transformed(x + 11, y + 42," : " + string(custo), card_scale,card_scale,0);
draw_set_font(-1);