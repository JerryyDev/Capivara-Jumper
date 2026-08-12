global.highscore = 0;
global.score_atual = 0;

global.acai = 0;

randomize();

global.in_trn = false;
global.proxima_room = rm_menu;


function trn_controller(){
    room_goto(global.proxima_room);
} 