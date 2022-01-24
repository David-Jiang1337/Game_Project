/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

interactRange = 50; //how far away (in pixels) the player can be when interacting with an item

moveSpeed = 300;

maxHealth = global.playerMaxHealth;
currentHealth = global.playerHealth;

weapon = spawnItem(global.playerWeapon, id);

function checkInteract(interactable, keydown){
	if(interactable == noone){return false}; //oh yeah, I use guard clauses instead of nested ifs when possible for readaibility, should probably get used to that
	if(point_distance(x,y,interactable.x,interactable.y)>interactRange){return false};
	if(!keydown){
		interactable.canInteract = true;
	} else {
		interactable.interact(id);
	}
}

function hurt(h){
	
	var damage = clamp(h,0,maxHealth-1); //max damage clamp is for one-shot protection
	
	currentHealth = clamp(currentHealth-damage,0,maxHealth); //make sure health can't go under 0
	if(currentHealth<=0){
		die()
	}
	
	global.playerHealth = currentHealth;
	global.playerMaxHealth = maxHealth;
	
}

function heal(h){
	
	var healing = clamp(h,0,maxHealth-currentHealth);
	
	currentHealth = clamp(currentHealth+healing,0,maxHealth);
	
	global.playerHealth = currentHealth;
	global.playerMaxHealth = maxHealth;
}

function die(){
	//set high score stuff
	if(global.currentLevel > global.maxLevel)global.maxLevel = global.currentLevel;
	global.currentLevel = 0;
	//reset player stats for next game
	global.playerWeapon = object_playerGun;
	global.playerHealth = 100;
	global.playerMaxHealth = 100;
	//gives death notification
	instance_create_depth(x,y,-100,object_died);
	//kill sound
	audio_stop_all();
	instance_destroy();
	//lmao
	audio_play_sound(sound_kekw, 0, false);
}

//background music