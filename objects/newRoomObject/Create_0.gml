randomize();

//how many rooms will be generated
var spawnRooms = 1; //just keep at 1
var portalRooms = 1;
var enemyRooms = clamp(2+global.currentLevel,2,20);
var gearRooms = clamp(global.currentLevel div 2,1,4);
var roomSize = 15*32;

//generating said rooms with a controller
var maxGridSize = (spawnRooms+portalRooms+enemyRooms+gearRooms)*3;
var grid = ds_grid_create(maxGridSize,maxGridSize); //sufficientlly large grid lmao
ds_grid_set_region(grid, 0, 0, maxGridSize-1, maxGridSize-1, undefined);

var controllerX = maxGridSize div 2;
var controllerY = maxGridSize div 2;
var controllerDirection = 0;

//creating a grid of rooms

while(spawnRooms > 0){
	controllerDirection = irandom_range(0,3)*90; //change direction randomly every turn
	controllerX += lengthdir_x(1,controllerDirection);
	controllerY += lengthdir_y(1,controllerDirection);
	
	if(grid[# controllerX,controllerY] == undefined){
		grid[# controllerX,controllerY] = "spawnRoom";
		spawnRooms -= 1;
	}
}

while(enemyRooms > 0){
	controllerDirection = irandom_range(0,3)*90; //change direction randomly every turn
	controllerX += lengthdir_x(1,controllerDirection);
	controllerY += lengthdir_y(1,controllerDirection);
	
	if(grid[# controllerX,controllerY] == undefined){
		grid[# controllerX,controllerY] = "enemyRoom";
		enemyRooms -= 1;
	}
}

while(gearRooms > 0){
	controllerDirection = irandom_range(0,3)*90; //change direction randomly every turn
	controllerX += lengthdir_x(1,controllerDirection);
	controllerY += lengthdir_y(1,controllerDirection);
	
	if(grid[# controllerX,controllerY] == undefined){
		grid[# controllerX,controllerY] = "gearRoom";
		gearRooms -= 1;
	}
}

while(portalRooms > 0){
	controllerDirection = irandom_range(0,3)*90; //change direction randomly every turn
	controllerX += lengthdir_x(1,controllerDirection);
	controllerY += lengthdir_y(1,controllerDirection);
	
	if(grid[# controllerX,controllerY] == undefined){
		grid[# controllerX,controllerY] = "portalRoom";
		portalRooms -= 1;
	}
}

//spawning said grid of rooms into the actual room
for(var i=0; i<maxGridSize; i++){
	for(var v=0; v<maxGridSize; v++){
		var gridValue = grid[# i,v];
		var subimgValue = 0;
		
		if(gridValue == undefined)continue;
		
		//set correct bitmasking values
		if(grid[# i,v-1] != undefined)subimgValue += bitmask.north;
		if(grid[# i-1,v] != undefined)subimgValue += bitmask.west;
		if(grid[# i+1,v] != undefined)subimgValue += bitmask.east;
		if(grid[# i,v+1] != undefined)subimgValue += bitmask.south;
		
		switch(gridValue){
			case("spawnRoom"):
				genRoomFromSprite(i*roomSize, v*roomSize, room_spawn, subimgValue);
				break;
			case("enemyRoom"):
				genRoomFromSprite(i*roomSize, v*roomSize, room_enemies, subimgValue);
				break;
			case("gearRoom"):
				genRoomFromSprite(i*roomSize, v*roomSize, room_gear, subimgValue);
				break;
			case("portalRoom"):
				genRoomFromSprite(i*roomSize, v*roomSize, room_portal, subimgValue);
				break;
			default:
				break;
		}
		
	}
}
