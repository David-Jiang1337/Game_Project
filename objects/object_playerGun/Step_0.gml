/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

var clicking;
switch(attackMode){
	case weaponMode.auto: clicking = mouse_check_button(mb_left); break;
	case weaponMode.semi: clicking = mouse_check_button_pressed(mb_left); break;
	default: clicking = mouse_check_button(mb_left); break;
}

if(clicking && attackTimer <= 0){
	attackTimer = attackInterval;
	attack();
}else{
	attackTimer -= global.realTime;
}
