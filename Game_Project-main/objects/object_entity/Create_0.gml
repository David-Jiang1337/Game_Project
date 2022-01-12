maxHealth = 100;
currentHealth = 100;

moveSpeed = 500; //in pixels per second

buffs = ds_list_create();
debuffs = ds_list_create();

//functions

function hurt(h){
	
	var damage = clamp(h,0,maxHealth-1); //max damage clamp is for one-shot protection
	
	currentHealth = clamp(currentHealth-damage,0,maxHealth); //make sure health can't go under 0
	if(currentHealth<=0){
		die()
	}
	
	show_debug_message(currentHealth);
	
}

function heal(h){
	
	var healing = clamp(h,0,maxHealth-currentHealth);
	
	currentHealth = clamp(currentHealth+healing,0,maxHealth);
	
}

function die(){
	
	//garbage collection
	ds_list_destroy(buffs);
	ds_list_destroy(debuffs);
	
	instance_destroy();
}