//keyboard checks
var up = keyboard_check(ord("W"));
var down = keyboard_check(ord("S"));
var left = keyboard_check(ord("A"));
var right = keyboard_check(ord("D"));

//movement variables
xdirection = right - left;
ydirection = down - up; //these works because booleans are automatically converted to binaries in this context

xdisplacement = (moveSpeed*global.realTime)*xdirection;
ydisplacement = (moveSpeed*global.realTime)*ydirection;

//collision checks and position updating functions
function xUpdate(){
	if(collision_line(x ,y ,x+(sprite_height/2)+xdisplacement, y, object_collision, false, true) == noone){ //no vertical collision
	
	x += xdisplacement;
	
	} else { //there is collision
	
		while(!place_meeting(x+0.01*xdirection, y, object_collision)){
			x += 0.01*xdirection;
		}
	
	}	
}

function yUpdate(){
	if(collision_line(x ,y ,x, y+(sprite_width/2)+ydisplacement, object_collision, false, true) == noone){ //no horizontal collision
	
	y += ydisplacement;
	
	} else { //there is collision
	
		while(!place_meeting(x, y+0.01*ydirection, object_collision)){
			y += 0.001*ydirection;
		}
	
	}
}

//actually running said functions
xUpdate();
yUpdate();

show_debug_message("x"+string(x)+"y"+string(y));