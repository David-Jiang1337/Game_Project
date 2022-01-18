if(instance_exists(object_enemy)){
	prompt = "You cannot progress until all enemies are defeated!"
	lock = true;
} else {
	prompt = "(F) Go Through Portal"
	lock = false;
}