global.highscore = 0;
global.score_atual = 0;

global.acai = 0;

global.skin_capivara_comprada = true;
global.skin_tamandua_comprada = false;
global.skin_poto_comprada = false;

global.sprite_equipada = spr_capivara;

randomize();

global.in_trn = false;
global.proxima_room = rm_menu;


function trn_controller(){
    room_goto(global.proxima_room);
} 