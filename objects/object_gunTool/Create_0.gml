/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

function attack(){
	show_debug_message("pew!");
}

function updatePos(){
	x=owner.x;
	y=owner.y;
	direction = point_direction(x,y,mouse_x,mouse_y);
	image_angle = direction;
	if(image_angle >= 90 && image_angle <= 270){
		image_yscale = -1;	
	} else {
		image_yscale = 1;	
	}
}