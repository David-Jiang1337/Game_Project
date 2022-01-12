//keyboard checks
var up = keyboard_check(ord("W"));
var down = keyboard_check(ord("S"));
var left = keyboard_check(ord("A"));
var right = keyboard_check(ord("D"));

//movement variables
var xdirection = right - left;
var ydirection = down - up; //these works because booleans are automatically converted to binaries in this context

var xdisplacement = (moveSpeed*global.realTime)*xdirection;
var ydisplacement = (moveSpeed*global.realTime)*ydirection;

//potential colliding objects
//var xcollide = collision_line(x ,y ,x+(sprite_width/2)+xdisplacement, y, object_collision, false, true);
//var ycollide = collision_line(x ,y ,x, y+(sprite_height/2)+ydisplacement, object_collision, false, true);

var xcollide = instance_place(x+xdisplacement,y,object_collision);
var ycollide = instance_place(x,y+ydisplacement,object_collision);

if(xcollide == noone){
	x += xdisplacement;
} else {
	x += ((xcollide.x-(xcollide.sprite_width/2*xdirection)) - (x+(sprite_width/2*xdirection)));	
}

if(ycollide == noone){
	y += ydisplacement;
} else {
	y += ((ycollide.y-(ycollide.sprite_height/2*ydirection)) - (y+(sprite_height/2*ydirection)));	
}

//actually running said functions

show_debug_message("x"+string(x)+"y"+string(y)); 
