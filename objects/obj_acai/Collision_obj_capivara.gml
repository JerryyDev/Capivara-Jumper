if (!coletado) {
    coletado = true;
    
    tween(id, "image_xscale", 1.5, tween_animation.back_out, 6, function() {
        tween(id, "image_xscale", 0.0, tween_animation.quad_in, 6, function() {
            if(image_index == 0){
                global.acai++;    
            }else if(image_index == 1){
                global.acai += 3;
            }else if(image_index == 2){
                global.acai += 6;
            }
            
            instance_destroy();
            audio_play_sound(snd_pickup,0,false);
        });
    });
    tween(id, "image_yscale", 1.5, tween_animation.back_out, 6, function() {
        tween(id, "image_yscale", 0.0, tween_animation.quad_in, 6);
    });
}