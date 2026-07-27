#region Variáveis

// Velocidade vertical atual (sobe se for negativa, cai se for positiva)
velv            = 0;

// Velocidade horizontal atual (vai pra esquerda se negativa, direita se positiva)
velh            = 0;

// Força máxima do pulo (em GML, valores negativos sobem o personagem na tela)
velvMAX         = -10;

// Velocidade de movimento para os lados
velhMAX         = 2.2;

// Peso da gravidade que puxa a capivara para baixo a cada frame
grav            = 0.3;


// Guardam o estado dos botões de direção (true = pressionado, false = solto)
Right           = false;
Left            = false;

#endregion



#region Métodos

// Método responsável por toda a física de movimento e colisão da capivara
Movimento_Horizontal = function(){
    
    // --- 1. CAPTURA DOS INPUTS (TECLAS) ---
    var _r, _l;
    _r = keyboard_check(vk_right); // Retorna true (1) se a seta Direita estiver pressionada
    _l = keyboard_check(vk_left);  // Retorna true (1) se a seta Esquerda estiver pressionada
    
    Right = _r;
    Left = _l;
    
    
    // --- 2. MOVIMENTAÇÃO HORIZONTAL ---
    // Subtrai Esquerda de Direita (ex: Direita(1) - Esquerda(0) = 1 * velhMAX -> move para a direita)
    velh = (Right - Left) * velhMAX;
    
    // Aplica o movimento no eixo X
    x += velh;
    
    
    // --- 3. COLISÃO E PULO NA PLATAFORMA ---
    // Verifica se haverá colisão com a plataforma no próximo movimento vertical (y + velv)
    var colide_plat = place_meeting(x, y + velv, obj_plat_tronco);
    
    // Só entra no pulo se a capivara estiver CAINDO (velv > 0) E colidir com a plataforma
    if (velv > 0 && colide_plat) {
        
        // Loop 'while': Aproxima a capivara pixel por pixel da plataforma até encostar perfeitamente
        while (!place_meeting(x, y + sign(velv), obj_plat_tronco)) {
            y += sign(velv);
        }
        
        // Reseta a velocidade de queda e aplica a força do pulo para cima (-10)
        velv = velvMAX;
        
    } else {
        // Se estiver no ar (subindo ou caindo sem colisão), soma a gravidade na velocidade vertical
        velv += grav;
    }
    
    // Aplica o movimento final no eixo Y
    y += velv;
}

#endregion