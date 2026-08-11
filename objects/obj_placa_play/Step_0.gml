var _mouse_over = position_meeting(mouse_x, mouse_y, id);


if (_mouse_over && !is_hover) {
    is_hover = true;
    if (!is_pressed) {
        tween(id, "image_xscale", 1.12, tween_animation.back_out, 8);
        tween(id, "image_yscale", 1.12, tween_animation.back_out, 8);
        tween(id, "image_angle", 3, tween_animation.back_out, 10);
    }
} 

else if (!_mouse_over && is_hover) {
    is_hover = false;
    is_pressed = false;
    
    tween(id, "image_xscale", 1.0, tween_animation.quad_out, 6);
    tween(id, "image_yscale", 1.0, tween_animation.quad_out, 6);
    tween(id, "image_angle", 0, tween_animation.quad_out, 6);
}

if (_mouse_over && mouse_check_button_pressed(mb_left)) {
    is_pressed = true;
    
    tween(id, "image_xscale", 1.20, tween_animation.back_in, 4);
    tween(id, "image_yscale", 0.75, tween_animation.back_in, 4);
    tween(id, "image_angle", -2, tween_animation.back_in, 4);
}

if (is_pressed && mouse_check_button_released(mb_left)) {
    is_pressed = false;
    
    if (_mouse_over) {
        tween(id, "image_xscale", 1.12, tween_animation.elastic_out, 12, function() {
            global.proxima_room = rm_jogo;
            layer_sequence_create("TRN", 0, 0, trn_in);
        });
        tween(id, "image_yscale", 1.12, tween_animation.elastic_out, 12);
        tween(id, "image_angle", 3, tween_animation.elastic_out, 12);
    } else {
        tween(id, "image_xscale", 1.0, tween_animation.quad_out, 6);
        tween(id, "image_yscale", 1.0, tween_animation.quad_out, 6);
        tween(id, "image_angle", 0, tween_animation.quad_out, 6);
    }
}