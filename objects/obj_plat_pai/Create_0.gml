#region Métodos

mola_impacto = function() {
    tween(id, "image_yscale", 0.70, tween_animation.quad_in, 8, function() {
        tween(id, "image_yscale", 1.0, tween_animation.elastic_out, 24);
    });
    tween(id, "image_xscale", 1.20, tween_animation.quad_in, 8, function() {
        tween(id, "image_xscale", 1.0, tween_animation.elastic_out, 24);
    });
}

Destruir = function(){
    
    var _cam_height = camera_get_view_height(view_camera[0]);
    var _marg = 73;
    
    if(camera_get_view_y(view_camera[0]) + _cam_height < y){
        var _x = random_range(sprite_width/2, room_width - sprite_width/2);
        var objeto = choose(obj_plat_tronco,obj_plat_movel,obj_plat_folha);
        instance_create_layer(_x, ystart - _cam_height - _marg,"Acai",objeto);
        instance_destroy();
    }
}

#endregion