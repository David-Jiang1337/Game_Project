/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

name = "Portal";
prompt = "Interact"; //prompt for interacting
lock = true;

function interact(){
	if(lock)return;
	global.currentLevel += 1;
	room_restart();
}