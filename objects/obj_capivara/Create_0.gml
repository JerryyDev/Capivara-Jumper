

#region Variáveis

// Velocidade vertical atual (sobe se for negativa, cai se for positiva)
velv            = 0;

// Velocidade horizontal atual (vai pra esquerda se negativa, direita se positiva)
velh            = 0;

// Força máxima do pulo
velvMAX         = -8;

// Velocidade de movimento para os lados
velhMAX         = 2.2;

// Peso da gravidade que puxa a capivara para baixo a cada frame
grav            = 0.3;


// Guardam o estado dos botões de direção (true = pressionado, false = solto)
Right           = false;
Left            = false;

cam_y = y;
cam_y_alvo = 0;

global.pontuacao = 0; 

#endregion



#region Métodos

// Método responsável por toda a física de movimento e colisão da capivara
Movimento_Horizontal = function(){
    
    // CAPTURA DOS INPUTS (TECLAS)
    var _r, _l;
    _r = keyboard_check(vk_right); // Retorna true (1) se a seta Direita estiver pressionada
    _l = keyboard_check(vk_left);  // Retorna true (1) se a seta Esquerda estiver pressionada
    
    Right = _r;
    Left = _l;
    
    
    // MOVIMENTAÇÃO HORIZONTAL
    // Subtrai Esquerda de Direita (ex: Direita(1) - Esquerda(0) = 1 * velhMAX -> move para a direita)
    velh = (Right - Left) * velhMAX;
    
    // Aplica o movimento no eixo X
    x += velh;
    
    if (velv > 0) {
        
        // Pega a instância exata da plataforma abaixo (detecta qualquer filho de obj_plat_pai)
        var _plat = instance_place(x, y + velv, obj_plat_pai);
        
        // Se colidiu E os pés da capivara estão ACIMA do topo da plataforma
        if (_plat != noone && bbox_bottom <= _plat.bbox_top + velv) {
            
            // Encosta a capivara perfeitamente no topo da plataforma
            while (!place_meeting(x, y + sign(velv), obj_plat_pai)) {
                y += sign(velv);
            }
            
            // Cria a partícula de pulo
            instance_create_layer(x, y, layer, obj_part);
            
            // COMPORTAMENTO ESPECÍFICO: Se a plataforma for a folha, faz SÓ ELA cair
            if (_plat.object_index == obj_plat_folha) {
                _plat.cair = true; // Ativa o cair apenas na instância '_plat' tocada
            }
            
            // Pula instantaneamente
            velv = velvMAX;
            
            var _pitch = irandom_range(1.1,1.2);
            audio_play_sound(snd_jump,0,false,,,_pitch);
            
        } else {
            // Se não encostou no topo, aplica gravidade apenas UMA vez
            velv += grav;
        }
    } else {
        // Se estiver subindo, aplica gravidade apenas UMA vez
        velv += grav;
    }
    
    // Aplica o movimento final no eixo Y
    y += velv;
    
    
    if(cam_y > y){ 
        cam_y = y;
    }
    
    camera_set_view_pos(view_camera[0], 0, cam_y - 160);

    
    if (y > camera_get_view_y(view_camera[0]) + 320) {
        room_goto(rm_score);
    }
}

#endregion