/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

name = "Medkit";
prompt = "(F) Use"; //prompt for interacting
healFactor = 20; //how much the medkit will heal for

function interact(){
	object_player.heal(healFactor);
	instance_destroy();
}