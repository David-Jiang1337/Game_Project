var camera = camera_get_default();

if(canInteract){
	draw_set_halign( fa_center );
	draw_text(camera_get_view_width(camera)*0.5,camera_get_view_height(camera)*0.75, prompt)
}