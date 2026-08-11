draw_sprite_ext(sprite_index, image_index, x, y, card_scale, card_scale, 0, c_white, 1);

draw_sprite_ext(sprite_skin,0,x-3,y+3,card_scale,card_scale,0,c_white,1);
draw_sprite_ext(spr_acai,2,x-18,y+40,card_scale,card_scale,0,c_white,1);

draw_set_font(fnt_play);
draw_set_colour(c_black);
draw_text(x + 3,y + 42," : " + string(custo));
draw_set_font(-1);