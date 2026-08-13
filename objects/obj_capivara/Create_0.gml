

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
            
            disparar_juice_part();
            
            
            // --- CHAMA O IMPACTO DIRETO NA PLATAFORMA ---
            _plat.mola_impacto();
            
            if (_plat.object_index == obj_plat_folha) {
                _plat.cair = true;
            }
            
            // Pula instantaneamente
            velv = velvMAX;
            
            var _pitch = irandom_range(1.1, 1.2);
            audio_play_sound(snd_jump, 0, false, , , _pitch);
            
            var _dir_x = sign(image_xscale) == 0 ? 1 : sign(image_xscale);
            
            disparar_juice_pulo();
            
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

disparar_juice_part = function(){
    if(global.sprite_equipada == spr_capivara){
        instance_create_layer(x, y, layer, obj_part);
    }else if(global.sprite_equipada == spr_poto){
        instance_create_layer(x, y, layer, obj_part_poto);
    }else if(global.sprite_equipada == spr_taman){
        instance_create_layer(x, y, layer, obj_part_taman);
    }
}

disparar_juice_pulo = function() {
    var _dir_x = sign(image_xscale) == 0 ? 1 : sign(image_xscale);
    
    if (global.sprite_equipada == spr_capivara) {
        tween(id, "image_yscale", 0.60, tween_animation.quad_in, 3, function() {
            tween(id, "image_yscale", 1.20, tween_animation.back_out, 10, function() {
                tween(id, "image_yscale", 1.0, tween_animation.quad_out, 6);
            });
        });
        
        tween(id, "image_xscale", _dir_x * 1.35, tween_animation.quad_in, 3, function() {
            var _sx = sign(image_xscale) == 0 ? 1 : sign(image_xscale);
            tween(id, "image_xscale", _sx * 0.80, tween_animation.back_out, 10, function() {
                var _sx2 = sign(image_xscale) == 0 ? 1 : sign(image_xscale);
                tween(id, "image_xscale", _sx2 * 1.0, tween_animation.quad_out, 6);
            });
        });
    }else if (global.sprite_equipada == spr_poto) {
        tween(id, "image_yscale", 0.75, tween_animation.sine_in, 4, function() {
            tween(id, "image_yscale", 1.30, tween_animation.sine_out, 12, function() {
                tween(id, "image_yscale", 1.0, tween_animation.sine_inout, 6);
            });
        });
        
        tween(id, "image_xscale", _dir_x * 1.15, tween_animation.sine_in, 4, function() {
            var _sx = sign(image_xscale) == 0 ? 1 : sign(image_xscale);
            tween(id, "image_xscale", _sx * 0.85, tween_animation.sine_out, 12, function() {
                var _sx2 = sign(image_xscale) == 0 ? 1 : sign(image_xscale);
                tween(id, "image_xscale", _sx2 * 1.0, tween_animation.sine_inout, 6);
            });
        });
    }else if (global.sprite_equipada == spr_taman) {
        tween(id, "image_yscale", 0.80, tween_animation.quad_in, 2, function() {
            tween(id, "image_yscale", 1.45, tween_animation.elastic_out, 14, function() {
                tween(id, "image_yscale", 1.0, tween_animation.quad_out, 6);
            });
        });
        
        tween(id, "image_xscale", _dir_x * 1.10, tween_animation.quad_in, 2, function() {
            var _sx = sign(image_xscale) == 0 ? 1 : sign(image_xscale);
            tween(id, "image_xscale", _sx * 0.65, tween_animation.elastic_out, 14, function() {
                var _sx2 = sign(image_xscale) == 0 ? 1 : sign(image_xscale);
                tween(id, "image_xscale", _sx2 * 1.0, tween_animation.quad_out, 6);
            });
        });
        
        var _ang = _dir_x * 12;
        tween(id, "image_angle", _ang, tween_animation.back_out, 5, function() {
            tween(id, "image_angle", 0, tween_animation.quad_out, 8);
        });
    }
}

#endregion