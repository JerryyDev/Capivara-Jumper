var _mouse_over = instance_position(mouse_x, mouse_y, id);


if (_mouse_over && !is_hover) {
    is_hover = true;
    if (!is_pressed) {
        tween(id, "image_xscale", 1.15, tween_animation.back_out, 8);
        tween(id, "image_yscale", 1.15, tween_animation.back_out, 8);
        tween(id, "image_angle", 3, tween_animation.back_out, 8);
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
    tween(id, "image_xscale", 1.20, tween_animation.quad_in, 4);
    tween(id, "image_yscale", 0.80, tween_animation.quad_in, 4);
    tween(id, "image_angle", -2, tween_animation.quad_in, 4);
}

if (is_pressed && mouse_check_button_released(mb_left)) {
    is_pressed = false;
    
    if (_mouse_over) {
        tween(id, "image_angle", 0, tween_animation.back_out, 6);
        tween(id, "image_yscale", 1.15, tween_animation.back_out, 6);
        
        tween(id, "image_xscale", 1.15, tween_animation.back_out, 6, function() {
            global.proxima_room = rm_loja;
            layer_sequence_create("TRN", 0, 0, trn_in);
        });
    } else {
        tween(id, "image_xscale", 1.0, tween_animation.quad_out, 6);
        tween(id, "image_yscale", 1.0, tween_animation.quad_out, 6);
        tween(id, "image_angle", 0, tween_animation.quad_out, 6);
    }
}