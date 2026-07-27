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

cam_y = y;
cam_y_alvo = 0;

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
    // 1. Só verifica colisão se estiver CAINDO
    if (velv > 0) {
        
        // Pega a instância exata da plataforma com a qual vai colidir
        var _plat = instance_place(x, y + velv, obj_plat_tronco);
        
        // 2. Se encontrou plataforma E os pés da capivara estão ACIMA do topo dela
        if (_plat != noone && bbox_bottom <= _plat.bbox_top + velv) {
            
            // Encosta a capivara perfeitamente no topo da plataforma
            while (!place_meeting(x, y + sign(velv), obj_plat_tronco)) {
                y += sign(velv);
            }
                    
            //Crio a particula de pulo
            instance_create_layer(x,y,layer,obj_part);
            
            // Pula instantaneamente
            velv = velvMAX;
            
        } else {
            // Se estiver abaixo ou subindo, ignora a plataforma e aplica a gravidade
            velv += grav;
        }
    } else {
        // Se estiver subindo (velv <= 0), aplica a gravidade normalmente
        velv += grav;
    }
    
    // Aplica o movimento final no eixo Y
    y += velv;
    
    
    
    if(cam_y > y) cam_y = y;
    
    camera_set_view_pos(view_camera[0], 0, cam_y - 160);

    
    if (y > camera_get_view_y(view_camera[0]) + 320) {
        room_restart();
    }
}

#endregion