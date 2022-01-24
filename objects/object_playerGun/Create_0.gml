/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

attackSpeed = 2;

spread = 20; //bullet spread in degrees

xbarrel = 24; //barrel offset from origin in pixels
ybarrel = 6;

xbarrelAbsolute = 0;
ybarrelAbsolute = 0;

interactableItem = object_gunInteract;

function attack(){
	audio_play_sound(sound_gun,2,false);
	
	var bullet = instance_create_layer(xbarrelAbsolute,ybarrelAbsolute,"Particles",object_bullet1)
	bullet.direction = direction+(irandom(spread)-(spread/2));
	bullet.damage = damage;
	bullet.moveSpeed = 1000;
	bullet.owner = owner;
}

function updatePos(){
	if(!instance_exists(owner)){instance_destroy();return;}
	x=owner.x;
	y=owner.y;
	direction = point_direction(x,y,mouse_x,mouse_y);
	image_angle = direction;
	if(image_angle >= 90 && image_angle <= 270){
		image_yscale = -1;	
	} else {
		image_yscale = 1;	
	}
	
	xbarrelAbsolute = x+lengthdir_x(xbarrel, direction);
	ybarrelAbsolute = y+lengthdir_y(ybarrel, direction);
}