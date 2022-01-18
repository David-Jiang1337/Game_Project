maxHealth = 100;
currentHealth = 100;

moveSpeed = 200; //in pixels per second

weapon = noone; //equipped weapon
//functions
function move(xdisplacement,ydisplacement){
	
	var xcollide = instance_place(x+xdisplacement,y,object_collision);
	var ycollide = instance_place(x,y+ydisplacement,object_collision);

	if(xcollide == noone){
		x += xdisplacement;
	} else {
		x += ((xcollide.x-(xcollide.sprite_width/2*sign(xdisplacement))) - (x+(sprite_width/2*sign(xdisplacement))));	
	}

	if(ycollide == noone){
		y += ydisplacement;
	} else {
		y += ((ycollide.y-(ycollide.sprite_height/2*sign(ydisplacement))) - (y+(sprite_height/2*sign(ydisplacement))));	
	}

}

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
	
	instance_destroy();
}

function drawHealth(){
	var healthPercent = currentHealth/maxHealth;
//	draw_set_color(c_black);
//	draw_rectangle(x-(sprite_width/2)-1,y+(sprite_height/2)+4,x+(sprite_width/2)+1,y+(sprite_height/2)+16,true);
	draw_set_color(c_green);
	draw_rectangle(x-(sprite_width/2),y+(sprite_height/2)+5,(x-(sprite_width/2)+(sprite_width*healthPercent)),y+(sprite_height/2)+15,false);
}