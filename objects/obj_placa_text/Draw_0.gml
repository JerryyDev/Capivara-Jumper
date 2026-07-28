draw_self();

if(pontos < global.highscore){
    pontos += global.highscore / (game_get_speed(gamespeed_fps) * 2);
    
    
}

draw_set_halign(1);
draw_set_valign(1);

draw_set_font(fnt_score);
draw_set_colour(c_black);

draw_text(x+2,y,string_format(pontos,0,0));