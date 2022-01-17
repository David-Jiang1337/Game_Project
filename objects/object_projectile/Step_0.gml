//displacement variables
var xdisplacement = lengthdir_x(moveSpeed*global.realTime, direction); 
var ydisplacement = lengthdir_y(moveSpeed*global.realTime, direction);

var collisionObj = ds_list_create()
var collisionNum = collision_line_list(x,y,x+xdisplacement,y+ydisplacement,object_entity,false,true,collisionObj,true);
var collisionWall = collision_line(x,y,x+xdisplacement,y+ydisplacement,object_collision,false,true);

if(collisionWall){ //touching wall
	instance_destroy();	
} else { //not touching wall
	for(var i=0; i<collisionNum; i++){
		if(collisionObj[|i] != owner){
			collisionObj[|i].hurt(damage);
			instance_destroy();
			break;
		}
	}
}

x += xdisplacement;
y += ydisplacement;

image_angle = direction;