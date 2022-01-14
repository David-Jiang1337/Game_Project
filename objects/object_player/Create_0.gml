/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

interactRange = 50; //how far away (in pixels) the player can be when interacting with an item

moveSpeed = 300;

function checkInteract(interactable, keydown){
	if(interactable == noone){return false}; //oh yeah, I use guard clauses instead of nested ifs when possible for readaibility, should probably get used to that
	if(point_distance(x,y,interactable.x,interactable.y)>interactRange){return false};
	if(!keydown){
		interactable.canInteract = true;
	} else {
		interactable.interact(id);
	}
};