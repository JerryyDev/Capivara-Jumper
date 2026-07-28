var Mouse_in = instance_position(mouse_x,mouse_y,id);

if(Mouse_in){
    image_xscale = lerp(image_xscale,1.2,0.2);
    image_yscale = lerp(image_yscale,1.2,0.2);
    
    xs_t = lerp(xs_t,1.2,0.2);
    ys_t = lerp(ys_t,1.2,0.2);
    
    if(mouse_check_button_pressed(mb_left)){
        global.proxima_room = rm_jogo;
        layer_sequence_create("TRN", 0, 0, trn_in);
    }
    
}else{
    image_xscale = lerp(image_xscale,1,0.2);
    image_yscale = lerp(image_yscale,1,0.2);
    
    xs_t = lerp(xs_t,1,0.2);
    ys_t = lerp(ys_t,1,0.2);
}