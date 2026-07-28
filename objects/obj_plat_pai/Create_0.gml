#region Métodos

Destruir = function(){
    
    var _cam_height = camera_get_view_height(view_camera[0]);
    var _marg = 60;
    
    if(camera_get_view_y(view_camera[0]) + _cam_height < y){
        var _x = random_range(sprite_width/2, room_width - sprite_width/2);
        var objeto = choose(obj_plat_tronco,obj_plat_movel,obj_plat_folha);
        instance_create_layer(_x, ystart - _cam_height - _marg,"Acai",objeto);
        instance_destroy();
    }
}

#endregion