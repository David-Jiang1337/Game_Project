/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

name = "Gun";
prompt = "(F) Pick Up"; //prompt for interacting

function interact(player){
	show_debug_message("Picked up "+name+"!");
	spawnItem(object_gunTool, player);
	instance_destroy();
}