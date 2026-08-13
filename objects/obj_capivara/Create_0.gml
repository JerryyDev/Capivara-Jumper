

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


sprite_index = global.sprite_equipada;


#region Métodos

// Método responsável por toda a física de movimento e colisão da capivara
Movimento_Horizontal = function(){
    
    // CAPTURA DOS INPUTS (TECLAS)
    var _r, _l;
    _r = keyboard_check(vk_right) or keyboard_check(ord("D"));
    _l = keyboard_check(vk_left) or keyboard_check(ord("A"));
    
    Right = _r;
    Left = _l;
    
    var _dir = Right - Left;
    
    // MOVIMENTAÇÃO HORIZONTAL
    velh = _dir * velhMAX;
    
    // Aplica o movimento no eixo X
    x += velh;
    
    // --- TWEEN: TROCA DE DIREÇÃO & INCLINAÇÃO (JUICE) ---
    if (_dir != 0) {
        // Vira o lado do sprite (mantendo a proporção)
        image_xscale = _dir * abs(image_xscale);
        
        // Inclina levemente o corpo na direção da corrida
        var _target_angle = -_dir * 6;
        tween(id, "image_angle", _target_angle, tween_animation.back_out, 6);
    } else {
        // Volta o ângulo para 0 quando solta os botões
        if (image_angle != 0) {
            tween(id, "image_angle", 0, tween_animation.quad_out, 6);
        }
    }
    
    // VERIFICAÇÃO DE COLISÃO E PULO
    if (velv > 0) {
        
        var _plat = instance_place(x, y + velv, obj_plat_pai);
        
        if (_plat != noone && bbox_bottom <= _plat.bbox_top + velv) {
            
            while (!place_meeting(x, y + sign(velv), obj_plat_pai)) {
                y += sign(velv);
            }
            
            instance_create_layer(x, y, layer, obj_part);
            
            // --- CHAMA O IMPACTO DIRETO NA PLATAFORMA ---
            _plat.mola_impacto();
            
            if (_plat.object_index == obj_plat_folha) {
                _plat.cair = true;
            }
            
            // Pula instantaneamente
            velv = velvMAX;
            
            var _pitch = irandom_range(1.1, 1.2);
            audio_play_sound(snd_jump, 0, false, , , _pitch);
            
            // --- TWEEN: SQUASH & STRETCH DO PULO (JUICE) ---
            // 1. Achata na aterrissagem (Squash rápido)
            var _dir_x = sign(image_xscale) == 0 ? 1 : sign(image_xscale);
            
            tween(id, "image_yscale", 0.70, tween_animation.quad_in, 3, function() {
                // 2. Estica no impulso do pulo
                tween(id, "image_yscale", 1.25, tween_animation.back_out, 8, function() {
                    // 3. Volta ao tamanho normal no ar
                    tween(id, "image_yscale", 1.0, tween_animation.quad_out, 6);
                });
            });
            
            // Reação no eixo X sincronizada usando sign(image_xscale) direto
            tween(id, "image_xscale", _dir_x * 1.20, tween_animation.quad_in, 3, function() {
                var _sx = sign(image_xscale) == 0 ? 1 : sign(image_xscale);
                tween(id, "image_xscale", _sx * 0.80, tween_animation.back_out, 8, function() {
                    var _sx2 = sign(image_xscale) == 0 ? 1 : sign(image_xscale);
                    tween(id, "image_xscale", _sx2 * 1.0, tween_animation.quad_out, 6);
                });
            });
            
        } else {
            velv += grav;
        }
    } else {
        velv += grav;
    }
    
    // Aplica o movimento final no eixo Y
    y += velv;
    
    // CAMERA
    if(cam_y > y){ 
        cam_y = y;
    }
    
    camera_set_view_pos(view_camera[0], 0, cam_y - 160);

    // QUEDA / DERROTA
    if (y > camera_get_view_y(view_camera[0]) + 320) {
        global.proxima_room = rm_score;
        layer_sequence_create("TRN", 0, cam_y, trn_in);
    }
}

#endregion