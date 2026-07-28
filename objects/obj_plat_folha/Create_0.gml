cair = false;

var _chance = irandom(100);
if(_chance > 50){
    instance_create_layer(x,y-20,"Acai",obj_acai);
}

event_inherited();