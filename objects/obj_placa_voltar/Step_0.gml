var Mouse_in = instance_position(mouse_x,mouse_y,id);

if(Mouse_in){
    image_xscale = lerp(image_xscale,1.2,0.2);
    image_yscale = lerp(image_yscale,1.2,0.2);
    
    if(mouse_check_button_pressed(mb_left)){
        room_goto(rm_menu);
    }
    
}else{
    image_xscale = lerp(image_xscale,1,0.2);
    image_yscale = lerp(image_yscale,1,0.2);
}