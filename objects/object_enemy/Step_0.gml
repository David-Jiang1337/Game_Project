if(instance_exists(object_player)){
	//check line of sight with player
	if(collision_line(x,y,object_player.x,object_player.y,object_collision,false,true) == noone && point_direction(x,y,object_player.x,object_player.y) <= playerDetectionRange){
		playerVisible = true;
		behaviourMode = enemyMode.alerted;
		moveSpeed = 200;
	}else{
		playerVisible = false;
		behaviourMode = enemyMode.patrol;
		moveSpeed = 50;
		attackTimer = attackInterval;
	}
	if(attackTimer > 0.5){
			attackTimer -= global.realTime;
	}
	
	//attack behaviour and movement
	if(behaviourMode == enemyMode.patrol){
		//movement
		if(irandom_range(0,2000)==1){
			direction = irandom_range(1,360);
		}
		var xdisplacement = lengthdir_x(moveSpeed*global.realTime, direction);
		var ydisplacement = lengthdir_y(moveSpeed*global.realTime, direction);
		move(xdisplacement, ydisplacement);
	} else if(behaviourMode == enemyMode.alerted){
		//movement
		if(point_distance(x,y,object_player.x,object_player.y) > 200){
			direction = point_direction(x,y,object_player.x,object_player.y);
			var xdisplacement = lengthdir_x(moveSpeed*global.realTime, direction);
			var ydisplacement = lengthdir_y(moveSpeed*global.realTime, direction);
			move(xdisplacement, ydisplacement);
		} else {
			if(irandom_range(0,1200)==1){
				direction = irandom_range(1,360);
			}
			var xdisplacement = lengthdir_x(moveSpeed*global.realTime, direction);
			var ydisplacement = lengthdir_y(moveSpeed*global.realTime, direction);
			move(xdisplacement, ydisplacement);
		}
		//attacking
		if(attackTimer > 0){
			attackTimer -= global.realTime;
		} else {
			weapon.attack();
			attackTimer = attackInterval;
		}
	}
}