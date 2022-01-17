/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

attackSpeed = 2;

xbarrel = 24; //barrel offset from origin in pixels
ybarrel = 6;

xbarrelAbsolute = 0;
ybarrelAbsolute = 0;

function attack(){
	var bullet = instance_create_depth(xbarrelAbsolute,ybarrelAbsolute,0,object_bullet1)
	bullet.direction = direction;
	bullet.damage = damage;
	bullet.moveSpeed = 1000;
	bullet.owner = owner;
}

function updatePos(){
	if(!instance_exists(owner)){instance_destroy();return;}
	x=owner.x;
	y=owner.y;
	if(collision_line(x,y,object_player.x,object_player.y,object_collision,false,true) == noone){
		direction = point_direction(x,y,object_player.x,object_player.y);
	}
	image_angle = direction;
	if(image_angle >= 90 && image_angle <= 270){
		image_yscale = -1;	
	} else {
		image_yscale = 1;	
	}
	
	xbarrelAbsolute = x+lengthdir_x(xbarrel, direction);
	ybarrelAbsolute = y+lengthdir_y(ybarrel, direction);
}