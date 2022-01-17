/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

weapon = spawnItem(object_enemyGun, id);

function die(){
	//garbage collection
	ds_list_destroy(buffs);
	ds_list_destroy(debuffs);
	
	instance_create_depth(x,y,200,object_medkit);
	
	instance_destroy();
}