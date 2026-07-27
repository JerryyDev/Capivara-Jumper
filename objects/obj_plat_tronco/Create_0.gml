#region Métodos

Destruir = function(){
    if(y > camera_get_view_y(view_camera[0]) + 340){
        instance_destroy();
        show_debug_message("Destrui plataforma!");
    }
}

#endregion