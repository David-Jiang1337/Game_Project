function objectFromColor(color){
	switch(color){
		case($555555):
			return object_wall1;
		case($241CEE):
			return object_enemy;
		case($F3BF00):
			return object_player;
		case($000000):
			return object_gunInteract;
		case($307B19):
			return object_medkit;
		case($92312E):
			return object_portal;
		
		default:
			return undefined;
	}
}

function objectGetDepth(obj){
	switch(obj){
		case(object_wall1):
			return "Enviroments";
		case(object_enemy):
			return "Entities";
		case(object_player):
			return "Entities";
		case(object_gunInteract):
			return "Interactables";
		case(object_medkit):
			return "Interactables";
		case(object_portal):
			return "Interactables";
			
		default:
			return undefined;
	}
}

/*note that this function was not fully created by me, there are several tweaks from the original but
the source and tutorial can be found here: https://www.youtube.com/watch?v=ACxJeYgPsIc */

function genRoomFromSprite(xpos,ypos,sprite,subimg){
	var height = sprite_get_height(sprite);
	var width = sprite_get_width(sprite);
	
	var surface = surface_create(width, height);
	surface_set_target(surface);
	draw_clear_alpha(c_black, 0);
	draw_sprite(sprite,subimg, 0, 0);
	surface_reset_target();
	
	var buffer = buffer_create(4 * width * height, buffer_fixed, 1);
	buffer_get_surface(buffer, surface, 0);
	
	for(var i=0; i<width; i++){
		for(var v=0; v<height; v++){
			var offset = 4 * (i + (v * width));
			
			var red = buffer_peek(buffer, offset, buffer_u8);
			var green = buffer_peek(buffer, offset+1, buffer_u8);
			var blue = buffer_peek(buffer, offset+2, buffer_u8);
			var alpha = buffer_peek(buffer, offset+3, buffer_u8);
			
			var color = make_color_rgb(red,green,blue);
			
			var object = objectFromColor(color);
			
			if(object == undefined || alpha == 0){continue};
			instance_create_layer(i*cellSize.width+xpos, v*cellSize.height+ypos, objectGetDepth(object), object);
		}
	}
	
	//garbage collection
	surface_free(surface);
	buffer_delete(buffer)
}