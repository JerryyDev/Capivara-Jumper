var _mouse_over = position_meeting(mouse_x, mouse_y, id);
var _esta_equipada = (global.sprite_equipada == sprite_skin); 

if (_esta_equipada) {
    sprite_index = spr_card_store_esq_check;
    image_alpha = 1.0;
} else {
    sprite_index = spr_card_store_esq; 
    
    if (comprei) {
        image_alpha = 1.0;
    }else if (global.acai < custo) {
        image_alpha = 0.6;
    }else {
        image_alpha = 1.0;
    }
}


if (_mouse_over && !is_hovered) {
    is_hovered = true;
    tween(id, "card_scale", 1.10, tween_animation.back, 0.15 * room_speed);
} 
else if (!_mouse_over && is_hovered) {
    is_hovered = false;
    tween(id, "card_scale", 1.0, tween_animation.quad_out, 0.12 * room_speed);
}


if (_mouse_over) {
    if (mouse_check_button_pressed(mb_left)) {
        if (!comprei && global.acai >= custo) {
            global.acai -= custo;
            comprei = true;
            global.sprite_equipada = sprite_skin;
            
            
            if (sprite_skin == spr_capivara) {
                global.skin_capivara_comprada = true;
            } else if (sprite_skin == spr_taman) {
                global.skin_tamandua_comprada = true;
            }
        } 
        else if (comprei) {
            global.sprite_equipada = sprite_skin;
        }
        
        tween(id, "card_scale", 0.92, tween_animation.quad_in, 0.08 * room_speed);
    } 
    else if (mouse_check_button_released(mb_left)) {
        tween(id, "card_scale", 1.10, tween_animation.back_out, 0.12 * room_speed);
    }
}