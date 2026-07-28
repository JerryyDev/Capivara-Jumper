Destruir();

if(hspeed == 0){
    hspeed = irandom_range(1,-1);
}

if(x > room_width || x < 0){
    hspeed *= -1;
}