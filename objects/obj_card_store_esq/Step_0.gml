var _mouse_over = position_meeting(mouse_x, mouse_y, id);

if(global.acai < custo) {
    image_alpha = 0.6;
    exit;
}else if(global.acai >= custo){
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
            tween(id, "card_scale", 0.92, tween_animation.quad_in, 0.08 * room_speed);
        } 
        else if (mouse_check_button_released(mb_left)) {
            tween(id, "card_scale", 1.10, tween_animation.back_out, 0.12 * room_speed);
        }
    }
}