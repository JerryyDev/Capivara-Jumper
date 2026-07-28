Movimento_Horizontal();

var _pontos = -round(y/10);

if(global.pontuacao < _pontos){
    global.pontuacao = _pontos;
}

if(global.pontuacao > global.highscore){
    global.highscore = global.pontuacao;  
}