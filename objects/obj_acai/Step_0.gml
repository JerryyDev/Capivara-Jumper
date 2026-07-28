var _cam_height = camera_get_view_height(view_camera[0]);

if(camera_get_view_y(view_camera[0]) + _cam_height < y+50){
    instance_destroy();
}