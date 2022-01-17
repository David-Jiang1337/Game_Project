function genRoomFromSprite(xpos,ypos,sprite){
	var surface = instance_create_depth(0,0,-1000,roomGenerationSurface);
	surface.sprite_index = sprite;
	for(var i=0;i<surface.sprite_height;i++){
		for(var v=0;v<surface.sprite_width;v++){
			var colorId = draw_getpixel(v,i);
			show_debug_message(colorId);
		}
	}
	
	surface.instance_destroy();
}