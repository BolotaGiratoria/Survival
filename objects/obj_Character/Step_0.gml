//---------Atualiza inputs

input_left		= keyboard_check(vk_left);
input_right		= keyboard_check(vk_right);
input_up		= keyboard_check(vk_up);
input_down		= keyboard_check(vk_down);
input_walk		= keyboard_check(vk_control);
input_run		= keyboard_check(vk_shift);


//---------Muda a velocidade
if (input_walk or input_run){
	ply_spd= abs((input_walk*slow_spd) - (input_run*run_spd));}
	else {ply_spd = normal_spd;
}



//---------Seta 0 nas variaveis
moveX = 0;
moveY = 0;


//---------Logica de movimento
moveX = (input_right - input_left) * ply_spd;
moveY = (input_down - input_up) * ply_spd;
//---Para soh andar para uma direcao if(moveX == 0 {moveY = (input_down - input_up) * ply_spd;}

//---------Verifica colisao
//Horizontal
//if(moveX != 0){
//	if(place_meeting (x+moveX, y, obj_arvore)){
//	repeat(abs(moveX)){
//	if(!place_meeting(x+sign(moveX), y, obj_arvore)){x += sign(moveX);} else{break;}
//	}
//	moveX=0;
//	}
//}

////Vertical
//if(moveY != 0){
//	if(place_meeting (x, y+moveY, obj_arvore)){
//	repeat(abs(+moveY)){
//	if(!place_meeting(x, y+sign(+moveY), obj_arvore)){x += sign(+moveY);} else{break;}
//	}
//	moveY=0;
//	}
//}

//---------Aplica o movimento
x += moveX;
y += moveY;
