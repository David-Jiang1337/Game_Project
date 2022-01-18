/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

weapon = spawnItem(object_enemyGun, id);
playerVisible = false;
playerDetectionRange = 300; //how far away can the enemy see the player in pixels
behaviourMode = enemyMode.patrol;
attackInterval = 2; //seconds between attacks
attackTimer = attackInterval; //timer for attacking

function die(){

	if(irandom(5)==1){
		instance_create_depth(x,y,200,object_medkit);
	}
	
	instance_destroy();
	
}