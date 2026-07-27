var _chance = irandom(100);
if(_chance > 50){
    instance_create_layer(x,y-20,"Acai",obj_acai);
}

#region Métodos

Destruir = function(){
    
    var _cam_height = camera_get_view_height(view_camera[0]);
    var _marg = 60;
    
    if(camera_get_view_y(view_camera[0]) + _cam_height + _marg < y){
        var _x = random_range(sprite_width/2, room_width - sprite_width/2);
        instance_create_layer(_x, ystart - _cam_height - _marg,"Acai",obj_plat_tronco);
        instance_destroy();
    }
}

#endregion