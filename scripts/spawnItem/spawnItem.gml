function spawnItem(itemObj, ownerObj){
	if(itemObj == noone || ownerObj == noone){show_debug_message("Use the function correctly lmao"); return false};
	if(ownerObj.weapon != noone){
		instance_create_layer(ownerObj.x,ownerObj.y,"Interactables",ownerObj.weapon.interactableItem)
		with(ownerObj.weapon){instance_destroy()}
	} //destroys currently equipped gun
	var spawnedItem = instance_create_depth(0,0,-1,itemObj);
	spawnedItem.owner = ownerObj;
	
	return spawnedItem.id;
}