/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

name = "Gun";
prompt = "(F) Pick Up"; //prompt for interacting

function interact(player){
	spawnItem(object_playerGun, player);
	instance_destroy();
}