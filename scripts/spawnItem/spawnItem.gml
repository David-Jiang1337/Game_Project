function spawnItem(itemObj, ownerObj){
	if(itemObj == noone || ownerObj == noone){show_debug_message("Use the function correctly lmao"); return false};
	var spawnedItem = instance_create_depth(0,0,-1,itemObj);
}