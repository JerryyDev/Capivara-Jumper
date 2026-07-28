audio_stop_all();
audio_play_sound(snd_menu,0,true);

if(global.in_trn){
    layer_sequence_create("TRN", 0, 0, trn_out);
}